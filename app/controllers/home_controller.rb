class HomeController < ApplicationController

  def index
    @slide = Product.take
  	@product = Product.all
  end

  def new
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    @line_item.save
    redirect_to home_index_path
  end

  def show
  	
  end
end
