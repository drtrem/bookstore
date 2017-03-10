Rails.application.routes.draw do
  get '/en/home_index_path' => 'home#index'
  get '/en/product_path' => 'products#show'
  get '/en/cart_path' => 'carts#show'

  #get 'home/new'

  #get 'home/create'

  #resources :orders
  #resources :line_items
  #resources :carts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #resource :products do
  #	resources :comments
  #end

  scope '(:locale)' do
  	resources :home
    resources :books
		resources :orders
		resources :line_items
		resources :carts

		resource :product do
  		resources :comments
  	end

		root 'home#index', as: 'store', via: :all
	end

  #root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
