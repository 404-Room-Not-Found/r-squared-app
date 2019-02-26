Rails.application.routes.draw do


  get 'booking/index'
# For styled pages
  root 'sessions#new'

  get 'sessions/new'
  get 'app/views/users/new.html.erb', to: 'users#new', as: 'user'
  get 'app/views/login/index.html.erb', to: 'login#index', as: 'login'
  get 'app/views/home/index.html.erb', to: 'home#index', as: 'home'
  get 'app/views/results/index.html.erb', to: 'results#index', as: 'results'
  get 'app/views/advancedsearch/index.html.erb', to: 'advancedsearch#index', as: 'advancedsearch'
  get 'app/views/browsingsearch/index.html.erb', to: 'browsingsearch#index', as: 'browsingsearch'
  get 'app/views/calendar/index.html.erb', to: 'calendar#index', as: 'calendar'
  get 'app/views/calendar_bookings/index.html.erb', to: 'calendar_bookings#index', as: 'calendar_bookings'
  get 'app/views/dailyreservations/index.html.erb', to: 'dailyreservations#index', as: 'dailyreservations'
  get 'app/views/calendar/show.html.erb', to: 'calendar#show', as: 'show_calendar'

  get    '/bright',  to: 'bright#index'
  get    '/rdmc',    to: 'rdmc#index'
  get    '/results',    to: 'results#index'

  get    '/bright',   to: 'bright#index'
  get    '/rdmc',   to: 'rdmc#index'
  get    '/add',    to: 'add#index'
  post   '/add',     to: 'rooms#create'
  get    '/delete',       to: 'delete#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create', as: 'login_path'
  delete '/logout',  to: 'sessions#destroy'

   resources :home
   resources :login
   resources :advancedsearch
   resources :results
   resources :browsingsearch
   resources :users, :bookings, :rooms
   resources :sessions
   resources :calendar
   resources :calendar_bookings
   
   get "*path", to: redirect('/')
end
