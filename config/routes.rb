Mondiale::Application.routes.draw do

	resources :posts, except: [:show, :index]

  resources :trips do
    member { post :vote }
    collection { post :sort_chapter_items }
  	resources :chapters do
      member { post :vote}
      resources :posts, except: [:index, :show] do
        member { post :vote}
      end
    end
  end

  get 'set_trip_cover/:id'  =>  'trips#set_photo',        as: :set_trip_cover
  post 'set_trip_cover/:id' =>  'trips#set_photo_save',   as: :set_trip_cover_save

  post 'delete_picture' =>      'post_attachments#destroy', as: :delete_picture
  get 'signup'          =>      'users#new',                as: :signup
  resources :users do
    member { get 'my_trips' }
  end

  get 'signin'          =>      'sessions#new',             as: :signin
  get 'signout'         =>      'sessions#destroy',         as: :signout
  resources :sessions, only: [:create]

  root 'welcome#index'
end
