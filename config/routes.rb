Rails.application.routes.draw do
  get 'user_favorites/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'search', controller: :application
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  post '/check_rq', to: 'play_lists#check_rq'
  resources :songs
  resources :songs, only: [:show] do
    resources :comments
    resources :user_favorites
  end
  resources :play_lists do
    resources :play_list_songs, only: [:create]
  end
  root 'static_pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
