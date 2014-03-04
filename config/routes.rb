Mondiale::Application.routes.draw do

  resources :trips

  get 'signup'          =>      'users#new',                as: :signup
  resources :users

  get 'signin'          =>      'sessions#new',             as: :signin
  get 'signout'         =>      'sessions#destroy',         as: :signout
  resources :sessions, only: [:create]

  root 'trips#index'
end
