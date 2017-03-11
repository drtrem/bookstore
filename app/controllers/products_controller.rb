class ProductsController < ApplicationController
	#load_and_authorize_resource except: [:create]
	
	def index 
		@product = Product.all 
	end 

	def show 
		@product = Product.all
		#@product = Product.includes(:categories).find(params[:id])
		@categories = Category.all
		#@product = Product.find_by_id(params[:product_id]) 
	end 

	def new 
		@product = Product.new 
	end 

	def edit 
		@product = Product.find(params[:product_id]) 
	end 

	def create 
		@product = Product.new(product_params) 

		if @product.save 
			redirect_to @product
		else 
			render 'new' 
		end 
	end 

	def update 
		@product = Product.find(params[:product_id]) 

		if @product.update(product_params) 
			redirect_to @product 
		else 
			render 'edit' 
		end 
	end 

	def destroy 
		@product = Product.find(params[:product_id]) 
		@product.destroy 

		redirect_to product_path 
	end 

	def category 
		@product = Product.where(category_id: params[:id])
		@categories = Category.all
		render 'show' 
	end 

	private
	def product_params 
		params.require(:product).
			permit(
				:title, 
				:category_id, 
				:author_id,
				:price, 
				:quantity, 
				:description, 
				:year, 
				:dimensions, 
				:materials, 
				:image_url
			) 
	end
end
