# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'top#index'
  resources :fighters, only: %i[index new create show edit update destroy] do
    resources :votes, only: [:create]
    resources :comments, only: %i[create destroy], shallow: true
  end
  resources :contacts, only: %i[new create]

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resource :profile, only: %i[edit show update]
end
