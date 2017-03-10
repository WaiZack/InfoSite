Rails.application.routes.draw do
  get 'membership_requests/new'

  get 'membership_acceptance/new'

  get 'teams/new'

  get 'teams/show'

  get 'teams/edit'

  get 'teams/index'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#home'
  get '/smartnation', to: 'landing#smartnation'
  get '/bigdata', to: 'landing#bigdata'
  get '/fintech' => 'landing#fintech'
  get '/users' => 'users#new'

  get '/dash' => 'dashboard#edit'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/changePassword' => 'dashboard#edit'

  get '/teams' => 'teams#index'
  get '/createTeam' => 'teams#new'
  get '/myTeams' => 'teams#myteams'

  get '/approve' => 'membership_requests#approve'

  resources :users
  resources :dashboard
  resources :account_activation, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :teams
  resources :membership_requests

end
