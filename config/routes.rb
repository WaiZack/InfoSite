Rails.application.routes.draw do
  get 'teams_controller/new'

  get 'teams_controller/show'

  get 'teams_controller/edit'

  get 'teams_controller/index'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#home'
  get '/smartnation', to: 'landing#smartnation'
  get '/bigdata', to: 'landing#bigdata'
  get '/fintech' => 'landing#fintech'
  get '/about' => 'landing#about'
  get '/users' => 'users#new'

  get '/dash' => 'dashboard#show'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/changePassword' => 'dashboard#edit'

  resources :users
  resources :dashboard
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

end
