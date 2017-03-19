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
    if @user.update_attributes(user_params)
      render 'delivery/index'
    else
      render 'orders/index'
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
end
