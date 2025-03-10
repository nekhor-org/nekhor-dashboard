Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :audios
  resources :images
  # resources :post_contents
  resources :posts do
    resources :post_contents, controller: 'post_contents'

    member do
      get :toggle
    end
  end
  resources :labels
  resources :menus
  resources :local_names
  resources :country_names
  resources :countries
  resources :locals
  resources :languages
  devise_for :users
  namespace :api do
    resources :locals do
      collection do
        get :home 
      end
    end
    resources :languages
    resources :countries
    resources :labels
    resources :favorites
    resources :itineraries 
    resources :posts do
      collection do
        get :get_itineraries
        get :get_lat_lng
      end
    end

    post '/login' => 'sessions#signin'
    
    get '/auth' => 'users#get_user'
    post '/sign_up' => 'users#create'
    put '/users' => 'users#update_user'
    delete 'users/:id' => 'users#destroy'
    
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
