Rails.application.routes.draw do

  namespace :admin do
    root "users#index", path: "/"
    resources :users, except: [:new, :create, :show]
    resources :words, only: :index
    resources :categories do
      resources :words, except: :show
    end
  end

  root "static_pages#home"
  get "sessions/new"
  get "sign_up" => "registers#new"
  get "sign_in" => "sessions#new"
  post "sign_in" => "sessions#create"
  delete "sign_out" => "sessions#destroy"
  resources :users do
    resources :following, only: :index
    resources :followers, only: :index
  end
  resources :registers, only: [:new, :create]
  resources :categories, only: :index
  resources :words, only: :index
  resources :lessons
  resources :relationships, only: [:create, :destroy]
  resources :following, only: :index
  resources :followers, only: :index
end
