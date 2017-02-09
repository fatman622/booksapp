Rails.application.routes.draw do
  
	root 'home#index'

	devise_for :users, controllers: {registrations: "registrations"}

	resources :profiles
	resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
