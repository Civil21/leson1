# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#index'
  resources :posts

  # створити
  # оновити
  # видалити
  # вивівд або перегляд
  # розміщення , вивів всіх обєктів
end
