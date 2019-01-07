Rails.application.routes.draw do
# For admin page
#     root 'bookings#index'
#     resources :users, :bookings, :rooms

# For styled pages
  get 'app/views/login/index.html.erb', to: 'login#index', as: 'login'
  get 'app/views/home/index.html.erb', to: 'home#index', as: 'home'
  get 'app/views/advancedsearch/index.html.erb', to: 'advancedsearch#index', as: 'advancedsearch'
  get 'app/views/browsingsearch/index.html.erb', to: 'browsingsearch#index', as: 'browsingsearch'

  resources :home
  resources :login
  resources :advancedsearch
  resources :browsingsearch

  root 'login#index'
end
