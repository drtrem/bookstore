ActiveAdmin.register Order do

	permit_params :order_number, :card_number, :name_on_card, :mm_yy, :cvv, :state, :subtotal, :cupon_id, :delivery_id

  index do
		column :id
		column :name_on_card
		column :mm_yy
		column("State", :sortable => :state) {|order| status_tag(order.state) }
		column :subtotal do |product|
      number_to_currency product.subtotal, :unit => "€"
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
