Rails.application.routes.draw do
  resources :items
  resources :profiles

  devise_for :users, controllers: { registrations: "registrations" }

  root 'home#index'
  get 'home/index'

get "/about", to: "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
