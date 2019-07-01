Rails.application.routes.draw do

  resources :songs, except: :show
  resources :songs, only: :show do
    resources :comments
  end
  resources :playlists
  resources :playlists,only: :show do
      resources :playlist_songs
  end
  resources :artists
  resources :genres
  resources :albums
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
