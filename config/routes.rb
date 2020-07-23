Rails.application.routes.draw do
  devise_for :users
  get 'groups/index'
  get 'groups/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'groups#index'

  resources :groups
end
