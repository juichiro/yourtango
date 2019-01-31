class SessionsController < ApplicationController
   before_action :check_user_logged_in , only: [:destroy]
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email,password)
      flash[:success] = 'ログイン完了'
      redirect_to words_url
    else
      flash.now[:danger]='ログイン失敗'
      render :new
    end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  private
  def login(email,password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end 
  end 

end
