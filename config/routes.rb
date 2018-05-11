Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :viewers
  resources :home
  resources :messages, only: [:create]
  resources :contracts
  resources :prices
  resources :cloths
  resources :accessories
  resources :google, only: [:index, :create]
  resources :photographers, only: [:index, :show, :update]
  resources :signatures, only: [:index, :create]
  resources :schedule, only: [:index]
  resources :raws, only: [:show, :create, :index]
  put 'photographers/:id/payall' => 'photographers#payall', :as => :payall_photo
  get '/articles/:id/:title' => 'articles#show', :as => :article_with_title
  get '/posing' => 'articles#index', :as => :article_posing
  get '/concept' => 'articles#index', :as => :article_concept
  get '/clothes' => 'articles#index', :as => :article_clothes
  get '/ask' => 'articles#index', :as => :article_ask
  get '/scription/:id' => 'contracts#scription', :as => :contract_scription
  post '/raws/:id/submit' => 'raws#submit', :as => 'submit_raws'
  post "/upload_image" => "upload#upload_image", :as => :upload_image
  get "/download_file/:name" => "upload#access_file", :as => :access_file, :name => /.*/
  get "/" => redirect("/home")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
