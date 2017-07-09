Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations, only: [:create, :index]
  resources :visited_cities, only: [:index]
  resources :visited_countries, only: [:index]
  resources :status, only: [:index]
  devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
end
