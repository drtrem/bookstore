class BooksController < ApplicationController
	def index
    @book = Product.find(params[:id])
  end

  def show
     @book = Product.find(book_params)
  end

  private
    def book_params
      params.require(:book).permit(:title, :authors, :price, :quantity, :description, :year, :dimensions, :materials, :image_url)
  	end
end
