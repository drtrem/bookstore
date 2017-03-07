class BooksController < ApplicationController
	def index
    @product = Product.find_by_id(params[:id])
  end

  def show
    @product = Product.find_by_id(params[:id]) 
  end

  private
    def book_params
      params.require(:book).permit(:title, :authors, :price, :quantity, :description, :year, :dimensions, :materials, :image_url)
  	end
end
