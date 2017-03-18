class BooksController < ApplicationController
	include CurrentCart

	before_action :set_cart, only: [:show]

  def show
  	@product = Product.find_by_id(params[:id])
    @line_items = LineItem.where("product_id = :product_id AND cart_id = :cart_id",{product_id: params[:id], cart_id: @cart.id}).first
    if @line_items.nil?
    	@quantity = 1
    else
    	@quantity = @line_items.quantity
    end
    @product.views = @product.views + 1
		@product.save
  end

end
