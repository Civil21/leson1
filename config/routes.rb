# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#index'

  resources :posts do
    member do
      post 'like'
    end
    # collection do
    #
    # end
  end

  resources :comments, only: [:destroy]
  post ':object_type/:object_id/comments', to: 'comments#create', as: 'comments'
  # resources :comments, only: [:create]

  resources :users, only: [:show]

  resources :categories, only: %i[show index]

  # створити
  # оновити
  # видалити
  # вивівд або перегляд
  # розміщення , вивів всіх обєктів
end
