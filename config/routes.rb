Rails.application.routes.draw do
  resources :home
  resources :prices
  get "/" => redirect("/home")
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
