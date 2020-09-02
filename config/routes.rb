Rails.application.routes.draw do
  get 'albums/index'
  get 'songs/index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'groups#index'

  resources :groups 
  resources :albums, only: [:edit, :update, :destroy]
  resources :songs, only: [:edit, :update, :destroy, :show]
  # resources :songs  

end
