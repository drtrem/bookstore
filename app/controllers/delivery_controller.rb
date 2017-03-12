class DeliveryController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@order = current_user.orders.build
		@order.add_line_items_from_cart(@cart)
		respond_to do |format|
			if @order.save
				Cart.destroy(session[:cart_id])
				session[:cart_id] = nil
				format.html { render 'payment/new', notice:'Thank you for your order.' }
				format.json { render action: 'show', status: :created, location: @order }
			else
				@cart = current_cart
				format.html { render action: 'new' }
				format.json { render json: @order.errors, status: :unprocessable_entity }
			end
		end
  end

  def order_params
      params.require(:delivery).permit(:order_number, :card_number, :name_on_card, :mm_yy, :cvv)
  end
end
