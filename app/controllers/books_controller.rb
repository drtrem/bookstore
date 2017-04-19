class BooksController < ApplicationController
  include CurrentCart

  before_action :set_cart, only: [:show]

  def show
    @product = Product.find_by_id(params[:id])
    @quantity = 1
    unless current_user == nil
      @user = User.find_by_id(current_user.id)
      @line_items = LineItem.where("product_id = :product_id AND cart_id = :cart_id",{product_id: params[:id], cart_id: @cart.id}).first
      @quantity = @line_items.quantity unless @line_items.nil?
    end
    @product.views += 1
    @product.save
    @reviews = Comment.where(product_id: @product.id, state: 'true')
  end
end
