class ProductsController < ApplicationController
	
	def show
		@catego = Array.new
		Category.all.each {|c| @catego << c.id}
		session[:category] ||= @catego
		@product = Product.order(sort_column + ' ' + sort_direction).where(category_id: session[:category])
		@categories = Category.all
	end

	def category
		if params[:id] == 'all'
			@product = Product.order(sort_column + ' ' + sort_direction).where(category_id: session[:category])
			@catego = Array.new
			Category.all.each {|c| @catego << c.id}
			session[:category] = @catego
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