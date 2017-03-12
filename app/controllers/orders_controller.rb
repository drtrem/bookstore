class OrdersController < InheritedResources::Base
	include CurrentCart

	before_action :set_cart, only: [:new, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    if @cart.line_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
			redirect_to store_url, notice: "Your cart is empty"
			return
		end
    #@order = Order.new
    @order = current_user.orders.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @user = User.find(current_user.id)
    @user.update_attributes(user_params)
    render 'delivery/new'
    #@order = current_user.orders.build(order_params)
    
    #@order = current_user.orders.build
		#@order.add_line_items_from_cart(@cart)
		#respond_to do |format|
		#	if @order.save
		#		Cart.destroy(session[:cart_id])
		#		session[:cart_id] = nil
		#		#OrderNotifier.received(@order).deliver
		#		format.html { render 'delivery/new', notice:'Thank you for your order.' }
		#		format.json { render action: 'show', status: :created, location: @order }
		#	else
		#		@cart = current_cart
		#		format.html { render action: 'new' }
		#		format.json { render json: @order.errors, status: :unprocessable_entity }
		#	end
		#end
	end
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_number, :card_number, :name_on_card, :mm_yy, :cvv)
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :city, :zip, :country, :phone, :shipping_first_name, :shipping_last_name, :shipping_address, :shipping_city, :shipping_zip, :shipping_country, :shipping_phone)
    end
end
