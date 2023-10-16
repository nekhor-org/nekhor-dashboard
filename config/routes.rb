Rails.application.routes.draw do
  resources :audios
  resources :images
  resources :post_contents
  resources :posts
  resources :labels
  resources :menus
  resources :local_names
  resources :country_names
  resources :countries
  resources :locals
  resources :languages
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
