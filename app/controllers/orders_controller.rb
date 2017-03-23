class OrdersController < InheritedResources::Base
	include CurrentCart

	before_action :set_cart, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end
  end

  def create
    @user = User.find(current_user.id)
    copy_params
    if session[:return_to] == nil
      render 'delivery/index'
    else
      session[:return_to] = nil
      @order = Order.find(session[:order_id])
      @delivery = Delivery.find(@order.delivery_id)
      session[:return_to] = true
      render 'confirm/index'
    end
	end

  private

  def user_params
    if params[:user].has_key?(:first_name)
      params.require(:user).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone)
    else
      params.require(:user).permit(:shipping_first_name, :shipping_last_name, :shipping_address, :shipping_city, :shipping_zip, :shipping_country, :shipping_phone)
    end
  end

  def copy_params
    if true == true
      @user.shipping_first_name = @user.first_name
      @user.shipping_last_name = @user.last_name
      @user.shipping_address = @user.address
      @user.shipping_city = @user.city
      @user.shipping_zip = @user.zip
      @user.shipping_country = @user.country
      @user.shipping_phone = @user.phone
    end
  end
end
