Rails.application.routes.draw do
  root 'words#index'

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  resources :words do
    collection do
      #get :favorite
      #get :top
    end
  end
  
  #タグのroutes定義
  get 'tags/:tag', to: 'words#index', as: :tag
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end