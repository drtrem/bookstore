ActiveAdmin.register Order do

	permit_params :order_number, :card_number, :name_on_card, :mm_yy, :cvv, :state, :subtotal, :cupon_id, :delivery_id

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
