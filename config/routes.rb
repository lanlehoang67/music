Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'search', controller: :application
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  resources :songs
  resources :songs, only: [:show] do
    resources :comments
  end

  root 'static_pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
