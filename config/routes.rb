Rails.application.routes.draw do

  get 'settings/index'

  get 'settings/update'

  get 'view_orders/index'

  get '/en/home_index_path' => 'home#index'
  
  get '/en/cart_path' => 'carts#show'

  get '/en/product/category/:id', to: 'products#category', as: 'category' 

  get '/en/carts/:id/cupon_path', to: 'carts#cupon_apply', as: 'cupon' 
  
  #devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  #ActiveAdmin.routes(self)

  #devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :user


  scope '(:locale)' do
    resources :settings, only: [:index, :create, :destroy]
    resource :settings, only: [:edit] do
      collection do
        patch 'update_password'
      end
    end
    #resources :users
  	resources :home, only: [:index, :create]
    resources :books, only: [:show]
		resources :orders, only: [:index, :create]
		resources :line_items, only: [:index, :new, :create, :update, :destroy]
		resources :carts, only: [:show, :edit]
    resources :payment, only: [:index, :create]
    resources :confirm, only: [:index]
    resources :complete, only: [:index]
    resources :delivery, only: [:index]
    resources :view_orders, only: [:index]
		resource :product do
  		resources :comments
  	end

		root 'home#index', as: 'store', via: :all
	end

  #root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
