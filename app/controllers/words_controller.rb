class WordsController < ApplicationController
  before_action :check_user_logged_in, only: [:index, :quiz]
  
  
  def index
    @words = current_user.words
    @word = current_user.words.build
  end

  def create
    @word = current_user.words.build(word_params)
    if @word.save
      redirect_to words_url
    else
      @words = current_user.words
      render :index
    end 
  end

  def edit
  end

  def destroy
     @word = Word.find(params[:id])#each.doのなかで削除ボタンつけれるようになった
     @word.destroy
     redirect_to words_url
  end
  def quiz
  @quiz = current_user.words.sample
  end 
  def quiz_answer
    @answer = current_user.words.find(params[:id])
  end 
  
  private
  def word_params
  params.require(:word).permit(:word, :meaning)
  end 
  def check_user_logged_in
    unless logged_in?
    redirect_to root_url
    end 
  end 
    
    
end
