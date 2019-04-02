Rails.application.routes.draw do
  sso_routes
  resources :subscribes
  resources :users

  root "topics#index"
  # resources :topics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :topics do
    resources :messages, only: [:index, :new, :create]
  end
  resources :messages, only: [:show, :edit, :update, :destroy]
end
