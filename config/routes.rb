Rails.application.routes.draw do

  namespace :admin do
    get 'orders/index'
  end

  devise_for :users

  # santo
  devise_scope :user do
    get '/users' => 'devise/registrations#new'
    get '/users/password' => 'devise/passwords#new'
  end

  root 'products#index'

  namespace :admin do

    root "products#index"
    resources :products, only: [:new, :create, :edit, :update, :destroy]

    resources :users do
      member do
        patch :archive
      end
    end

    resources :categories

  end

  # santo
  resources :products, only: [:index, :show]

  # santo
  resources :attachments, only: [:show, :new]

end
