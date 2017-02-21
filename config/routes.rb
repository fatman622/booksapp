Rails.application.routes.draw do
  
  apipie
	root 'home#index'

	devise_for :users, controllers: {registrations: "registrations"}

	resources :profiles
	resources :books
	resources :bookexchanges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
