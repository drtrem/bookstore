class BooksController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:show]
  helper_method :quantity

  def show
    @product = Product.find_by_id(params[:id])
    @user = User.find_by_id(current_user.id) unless current_user.nil?
    @product.views += 1
    @product.save
    @reviews = Comment.where(product_id: @product.id, state: 'true')
  end

  def quantity
    @line_items = LineItem.where("product_id = :product_id AND cart_id = :cart_id",{product_id: params[:id], cart_id: @cart.id}).first
    @quantity = @line_items.quantity unless @line_items.nil?
    @quantity || 1
  end

  def update
    #redirect_to line_items_path(product_id: @product.id)
  end
end 
