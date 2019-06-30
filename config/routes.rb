Rails.application.routes.draw do
  get 'albums/show'
  resources :artists
  resources :genres
  resources :albums
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
