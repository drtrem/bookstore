class ProductsController < ApplicationController
	
	def show 
		session[:category] ||= [1,2,3]
		@product = Product.order(sort_column + ' ' + sort_direction).where(category_id: session[:category])
		@categories = Category.all
	end

	def category
		if params[:id] == 'all'
			@product = Product.order(sort_column + ' ' + sort_direction).where(category_id: session[:category])
			session[:category] = [1,2,3]
		else
			session[:category] = params[:id]
			@product = Product.where(category_id: params[:id])
		end
		@categories = Category.all
		render 'show' 
	end

	private

	def sort_column
  	Product.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
	end

	def sort_direction
  	%w[asc desc].include?(params[:direction]) ?  params[:direction] : "desc"
	end
end
