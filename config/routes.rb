Rails.application.routes.draw do

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  root 'welcome#index'
  resources :artists, except: [:edit, :update] do
    member do
      get 'related_artists'
      get 'top_tracks'
      get 'all_albums'
    end
    resources :tracks, except: [:edit, :update]
    resources :albums, except: [:edit, :update] do 
      member do
        get 'all_tracks'
      end
    end
  end
  get '/tracks', to: 'tracks#all'
  get '/albums', to: 'albums#all'
  resources :users
  resources :playlists do
    member do
      get 'add_track'
      post 'add_track'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

