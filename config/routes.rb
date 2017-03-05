Rails.application.routes.draw do
  #resources :orders
  #resources :line_items
  #resources :carts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  devise_for :models

  #resource :products do
  #	resources :comments
  #end

  scope '(:locale)' do 
		resources :orders
		resources :line_items
		resources :carts

		resource :product do
  		resources :comments
  	end

		root 'products#index', as: 'store', via: :all
	end

  #root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
