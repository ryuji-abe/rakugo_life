Rails.application.routes.draw do
  root 'sessions#new'
  resources :netas do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new, :create, :edit, :show, :update, :index, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
