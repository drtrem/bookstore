class ConfirmController < ApplicationController
	include CurrentCart

	before_action :set_cart, only: [:new]

  def index
  end

  def new
  	@order = Order.find(session[:order_id])
  	@delivery = Delivery.find(@order.delivery_id)
		render 'confirm/new' 
  end

  def create
  end
end
