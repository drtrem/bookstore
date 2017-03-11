ActiveAdmin.register Product do

	permit_params :title, :author_id, :category_id, :price, :quantity, :description, :year, :dimensions, :materials, :image_url

	index do
		column :title
		column :author_id
		column :category_id
		column :description
		column :quantity
		column :year
		column :dimensions
		column :materials
		column :image_url
    column :price do |product|
      number_to_currency product.price, :unit => "€"
  	end
  	actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
