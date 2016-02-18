Rails.application.routes.draw do
  devise_for :users

  resources :projects, only: [:index, :show, :new, :create] do
    resources :tasks, only: [:create, :show]
  end

  get 'static_pages/about'

  root 'static_pages#home'
end
