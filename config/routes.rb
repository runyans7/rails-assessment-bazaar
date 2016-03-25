Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :projects, except: [:delete] do
    resources :tasks, only: [:create, :show, :index]
  end

  get 'static_pages/about'

  root 'static_pages#home'
end
