# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'
  resources :fighters, only: %i[index new create show] do
    resources :votes, only: [:create]
  end
end
