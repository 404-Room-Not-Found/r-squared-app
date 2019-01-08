Rails.application.routes.draw do
  
# For admin page
    # root 'bookings#index'
    # resources :users, :bookings, :rooms
  

# For styled pages
  root 'login#index'
  
  get 'sessions/new'
  get 'app/views/login/index.html.erb', to: 'login#index', as: 'login'
  get 'app/views/home/index.html.erb', to: 'home#index', as: 'home'
  get 'app/views/advancedsearch/index.html.erb', to: 'advancedsearch#index', as: 'advancedsearch'
  get 'app/views/browsingsearch/index.html.erb', to: 'browsingsearch#index', as: 'browsingsearch'
  get 'app/views/rooms/index.html.erb', to: 'rooms#index', as: 'rooms'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :home
  resources :login
  resources :advancedsearch
  resources :browsingsearch
  resources :user
  resources :sessions
  resources :rooms, :bookings
end
