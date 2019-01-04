Rails.application.routes.draw do
  get 'welcome/index'
  get 'app/views/login/index.html.erb', to: 'login#index', as: 'login'
  get 'app/views/welcome/index.html.erb', to: 'welcome#index', as: 'welcome'
  get 'app/views/advancedsearch/index.html.erb', to: 'advancedsearch#index', as: 'advancedsearch'

  resources :login
  resources :advancedsearch

  root 'login#index'
end
