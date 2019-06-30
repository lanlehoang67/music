Rails.application.routes.draw do
  resources :genres
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root :to => "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
