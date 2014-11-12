require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  get "admin", to: "admin#show", as: :admin

  resources :regions, except: [:update, :destroy] do
    resources :categories, except: [:index]
    resources :posts, except: [:index]
  end

  root "regions#index"
end
