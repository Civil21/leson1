# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  resources :posts

  resources :comments, only: [:destroy]

  post ':object_type/:object_id/comments', to: 'comments#create', as: 'comments'
  # resources :comments, only: [:create]

  # створити
  # оновити
  # видалити
  # вивівд або перегляд
  # розміщення , вивів всіх обєктів
end
