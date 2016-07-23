Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get '/home', to: 'home#index'
  get '/history', to: 'history#index'
  resources :members
end
