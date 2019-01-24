Rails.application.routes.draw do
  
  resources :words, only: [:index, :create, :edit,:destroy]
  get 'words/quiz', to: 'words#quiz',as: 'quiz'
  get 'words/quiz_answer/:id', to: 'words#quiz_answer',as: 'answer'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'sign_up', to: 'users#new'
  resources :users, only: [:show, :new, :create]
end
