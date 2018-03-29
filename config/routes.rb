Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :viewers
  resources :home
  resources :messages, only: [:create]
  resources :contracts
  resources :prices
  resources :signatures, only: [:index, :create]
  resources :raws, only: [:show, :create, :index]
  get '/clothes/:id/:title' => 'clothes#show', :as => :article_with_title
  get '/posing' => 'articles#index', :as => :article_posing
  get '/concept' => 'articles#index', :as => :article_concept
  get '/clothes' => 'articles#index', :as => :article_clothes
  get '/ask' => 'articles#index', :as => :article_ask
  post ':id/submit' => 'raws#submit', :as => 'submit_raws'
  post "/upload_image" => "upload#upload_image", :as => :upload_image
  get "/download_file/:name" => "upload#access_file", :as => :access_file, :name => /.*/
  get "/" => redirect("/home")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
