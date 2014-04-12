Mondiale::Application.routes.draw do

	resources :posts, except: [:show, :index]
  resources :trip_plans, only: [:show, :new, :index]

  resources :trips do
    member do
      get   :new_cover
      post  :create_cover
    end
    collection {
      post  :sort_chapter_items
    }
  	resources :chapters do
      resources :posts, except: [:index, :show] do
      end
    end
  end

  # get 'set_trip_cover/:id'  =>  'trips#set_photo',        as: :set_trip_cover
  # post 'set_trip_cover/:id' =>  'trips#set_photo_save',   as: :set_trip_cover_save

  post 'delete_picture' =>      'post_attachments#destroy', as: :delete_picture
  get 'signup'          =>      'users#new',                as: :signup
  resources :users do
    member { get 'my_trips' }
    member { get 'inspiration_list'}
    member { get 'my_trip_plans' }
  end

  get 'signin'          =>      'sessions#new',             as: :signin
  get 'signout'         =>      'sessions#destroy',         as: :signout
  resources :sessions, only: [:create]
  resources :inspirations, only: [:create, :destroy]

  root 'welcome#index'
end
