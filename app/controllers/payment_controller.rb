class PaymentController < ApplicationController
	include CurrentCart

	before_action :set_cart, only: [:new, :create]

  def index
  	redirect_to new_confirm_path
  end

  def new
  	if params[:user].nil?
			redirect_to delivery_new_path, notice: "Your cart is empty"
			return
		end
  	@order = Order.new
  	@order.delivery_id = params[:user][:id]
  	session[:delivery_id] = params[:user][:id]
  	render 'payment/new'
  end

  def create
  	@order = current_user.orders.build(order_params)
		@order.add_line_items_from_cart(@cart)
		@order.cupon_id = @cart.cupon_id
		@order.delivery_id = session[:delivery_id]
		@delivery = Delivery.find(@order.delivery_id)
		@order.subtotal = @order.total_price + @order.total_delivery - @order.total_cupon
		respond_to do |format|
			if @order.save
				session[:order_id] = @order.id
				format.html { render 'confirm/new', notice:'Thank you for your order.' }
				format.json { render action: 'show', status: :created, location: @order }
			else
				@cart = current_cart
				format.html { render action: 'new' }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
  end

  private

  def order_params
    params.permit(:card_number, :name_on_card, :mm_yy, :cvv)
  end
end
