Rails.application.routes.draw do
  devise_for :users
  # get 'prototype/index'
  root to: 'prototypes#index'
  resources :prototypes do
    resources :comments
  end
  resources :users


end
