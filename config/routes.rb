Rails.application.routes.draw do
  get "home/index"
  get "users/index"
  get "ratings/create"
  get "ratings/update"
  get "stores/index"
  get "stores/show"

  root "home#index"

 resources :stores do
  resources :ratings, only: [:create, :update]
end

  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :sessions, only: [:new, :create, :destroy]
  resources :ratings, only: [:new, :create, :edit, :update] 
  
  get "user/dashboard", to: "users#dashboard"  # ✅ Changed from users/dashboard to user/dashboard
get "owner/dashboard", to: "owner#dashboard"
get "admin/dashboard", to: "admin#dashboard"
get '/signup', to: "users#new"
post '/signup', to: 'users#create'  
get 'change_password', to: 'users#edit_password'
  patch 'update_password', to: 'users#update_password'
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"  # ✅ FIXED Logout Route
get "/logout", to: "sessions#destroy"

  namespace :admin do
    get "dashboard", to: "admin#dashboard"
    get "users", to: "admin#users"
    get "stores", to: "admin#stores"
        get 'dashboard', to: 'stores#dashboard'
  end
  resources :stores  # ✅ This ensures store_path(store.id) works

  namespace :owner do
    get "dashboard", to: "owners#dashboard"
    get "edit_store", to: "owners#edit_store"
    patch "update_store", to: "owners#update_store"
  end
end
