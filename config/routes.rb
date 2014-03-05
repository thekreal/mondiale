Mondiale::Application.routes.draw do

	resources :posts, except: [:show, :index]
  resources :post_attachments
  resources :trips do
  	resources :chapters do
      resources :posts, except: [:show, :index]
      end
    end

  get 'signup'          =>      'users#new',                as: :signup
  resources :users

  get 'signin'          =>      'sessions#new',             as: :signin
  get 'signout'         =>      'sessions#destroy',         as: :signout
  resources :sessions, only: [:create]

  root 'welcome#index'
end
