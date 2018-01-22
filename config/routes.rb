Rails.application.routes.draw do
  mount Mercury::Engine => '/'
  # For details on the DSL available within this file, see http://guides.rubyon     rails.org/routing.html
  get '/', to: 'home#index'
  get '/home', to: 'home#index'
  put '/home', to: 'home#mercury_update', as: 'mercury_update_announcement'
  post '/home', to: 'home#mercury_update', as: 'mercury_create_announcement'
  get '/history', to: 'history#index'

  resources :members
  resources :calendars, except: :show
  resources :newsletters, except: :show
  resources :photos, except: :show
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/admin', to: 'admin#index'
end
