class ViewOrdersController < ApplicationController
  def index
  	@order = Order.where(user_id: current_user.id)
  end
end
