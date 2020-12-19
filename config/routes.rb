# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:create]

  # створити
  # оновити
  # видалити
  # вивівд або перегляд
  # розміщення , вивів всіх обєктів
end
