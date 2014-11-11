require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get "admin", to: "admin#show", as: :admin
  get "history", to: "history#show", as: :history
  resources :posts, except: :index
  resources :regions, except: [:update, :destroy] do
    resources :categories, except: [:index]
  end

  get "homes" => "homes#show"

  root "homes#show"
end
