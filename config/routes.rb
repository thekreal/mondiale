Mondiale::Application.routes.draw do

	resources :posts, except: [:show, :index]

  resources :trips do
    member { post :vote }
  	resources :chapters do
      resources :posts, except: [:show, :index]
      end
    end

  post 'delete_picture' =>      'post_attachments#destroy', as: :delete_picture
  get 'signup'          =>      'users#new',                as: :signup
  resources :users

  get 'signin'          =>      'sessions#new',             as: :signin
  get 'signout'         =>      'sessions#destroy',         as: :signout
  resources :sessions, only: [:create]

  root 'welcome#index'
end
