Rails.application.routes.draw do

  namespace :admin do
    root "users#index", path: "/"
    resources :users, only: [:edit, :update, :index]
    resources :categories
  end

  root "static_pages#home"
  get "sessions/new"
  get "sign_up" => "registers#new"
  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#destroy"
  resources :users
  resources :registers, only: [:new, :create]
  resources :categories, only: :index
  resources :words, only: :index
  resources :lessons
end
