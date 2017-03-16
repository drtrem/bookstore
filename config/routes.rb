Rails.application.routes.draw do
  get 'complete/index'

  get 'complete/new'

  get 'complete/create'

  #get 'payment/index'

  #get 'payment/new'

  #get 'payment/create'

  get 'delivery/index'

  get 'delivery/new'

  get 'delivery/create'

  get '/en/home_index_path' => 'home#index'
  get '/en/product_path' => 'products#show'
  get '/en/cart_path' => 'carts#show'

  get '/en/product/category/:id', to: 'products#category', as: 'category' 

  #get '/en/cupon_path/:id' => 'carts#cupon_apply'

  get '/en/carts/:id/cupon_path', to: 'carts#cupon_apply', as: 'cupon' 
 
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
    #resources :user
  	resources :home
    resources :books
		resources :orders
		resources :line_items
		resources :carts
    resources :payment
    resources :confirm
    resources :complete, only: [:show]
		resource :product do
  		resources :comments
  	end

		root 'home#index', as: 'store', via: :all
	end

  #root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
