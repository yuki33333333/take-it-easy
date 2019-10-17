Rails.application.routes.draw do
  namespace 'api' do
    resources :todos
  end
    
  get 'reviews/index'
  get 'todos/index'
  get 'sessions/new'
  root 'pages#index'

  resources :users
  resources :todos
  
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'
end
