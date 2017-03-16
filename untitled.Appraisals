    t.string   "order_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "card_number"
    t.string   "name_on_card"
    t.string   "mm_yy"
    t.string   "cvv"

    migration add_post_id_to_comment post_id:integer

    rails generate migration add_shipping_address_to_orders shipping_first_name:, shipping_last_name:, shipping_address:, shipping_city:, shipping_zip:, shipping_country:, shipping_phone:
    rails generate migration add_shipping_billing_address_to_users first_name: last_name: address: city: zip: country: phone: shipping_first_name: shipping_last_name: shipping_address: shipping_city: shipping_zip: shipping_country: shipping_phone:
    
    rails generate migration add_shipping_address_to_orders shipping_first_name:, shipping_last_name:, shipping_address:, shipping_city:, shipping_zip:, shipping_country:, shipping_phone:

    rails generate migration Authors first_name: last_name: description:
    rails generate migration Categories category:
    rails generate model Author first_name: last_name: description:
    rails generate model Category category:

    def change
    change_table :products do |t|
          t.remove :shipping_first_name, :shipping_last_name, :shipping_address, :shipping_city, :shipping_zip, :shipping_country, :shipping_phone, :first_name, :last_name, :address, :city, :zip, :country, :phone
        end
  end

  t.belongs_to :author, index: true

  params.require(:order).permit(:order_number, :first_name, :last_name, :address, :city, :zip, :country, :phone, :card_number, :name_on_card, :mm_yy, :cvv)

  rails generate migration Cupon number:integer price:integer

  create_table :cupon do |t|
      t.integer :number
      t.integer :price

      t.timestamps
    end


  = form_for @semester, url: semesters_path do |f|
    = f.text_field :name
    = f.text_field :fullname
    = f.check_box :current
    = f.submit "Создать семестр"

     .input-group.general-input-group
        %label.font-weight-light= t('.enter_your_coupon_code')
        %input.form-control.mb-30{type: "text", placeholder: "Enter Your Coupon Code "}
        %div
          %button.btn.btn-primary.mr-5.mb-15.visible-xs-inline-block= t('.apply_coupon')
          %button.btn.btn-primary.mb-15.res-block= t('.update_cart')
          = button_to 'Update Cart', edit_cart_path, method: :get, class: 'button btn btn-primary mb-15 res-block' 

              @order = current_user.orders.build
    @order.cupon_id = @cupon.id
    @order.save

    #@order = current_user.orders.build
    #@order.add_line_items_from_cart(@cart)
    #@order.save

    #@order = Line_items.find(@cart.id).order_id
    @order = Line_items.find_by(cart_id: @cart.id).order_id
    find_by

    @order.cupon_id = @cupon.id
    @order.save

    self.cupon_id

    = form_for @cart, :url => new_payment_path, :method => :get do |f|
  = f.collection_radio_buttons :id, Delivery.all, :id, :method
  = f.submit 'aaaa'
= collection_radio_buttons(:cart, :id, Delivery.all, :id, :method) do |b|
  = b.label(:"data-value" => b.value) { b.radio_button + b.text }

  = form_for(@cart) do |f|
  = f.radio_button :id, 'train'
  = f.label :delivery, 'train', :value => 'train'
  = f.radio_button :id, 'air'
  = f.label :delivery, 'air', :value => 'air'
  = f.submit 'aaaa'