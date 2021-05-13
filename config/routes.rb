# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'top#index'
  resources :fighters, only: %i[index new create show edit update] do
    resources :votes, only: [:create]
  end
  resources :contacts, only: %i[new create]
end
