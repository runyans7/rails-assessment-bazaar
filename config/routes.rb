Rails.application.routes.draw do
  devise_for :users
  resources :projects, only: [:index, :show, :new, :create]
  get 'static_pages/about'

  root 'static_pages#home'
end
