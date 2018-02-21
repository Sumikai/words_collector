Rails.application.routes.draw do
  root 'words#index'

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :favorites, only: [:toggle]
  
  resources :words do
    get 'favorites/toggle'
  end
  
  #タグのroutes定義
  get 'tags/:tag', to: 'words#index', as: :tag
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
