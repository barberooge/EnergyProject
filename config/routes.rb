Rails.application.routes.draw do

  root 'static_pages#home'
    
  get 'sessions/new'

  get 'about', to: 'static_pages#about'

  get 'help', to: 'static_pages#help'

  get 'contact', to: 'static_pages#contact'

  resources :users

  get 'signup', to: 'users#new'

  post '/signup',  to: 'users#create'

  get 'edit', to: 'users#edit'
    
  get    '/login',   to: 'sessions#new'
    
  post   '/login',   to: 'sessions#create'
    
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
