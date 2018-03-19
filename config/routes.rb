Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :viewers
  resources :clothes
  resources :home
  resources :messages, only: [:create]
  resources :contracts
  resources :prices
  resources :signatures, only: [:index, :create]
  resources :raws, only: [:show, :create, :index]
  post ':id/submit' => 'raws#submit', :as => 'submit_raws'
  get "/" => redirect("/home")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
