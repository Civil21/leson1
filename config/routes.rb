# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  resources :posts do
    resources :comments, only: %i[create]
  end

  resources :comments, only: [:destroy]

  post 'comments/:comment_id', to: 'comments#comment_create', as: 'comment_comments'
  # resources :comments, only: [:create]

  # створити
  # оновити
  # видалити
  # вивівд або перегляд
  # розміщення , вивів всіх обєктів
end
