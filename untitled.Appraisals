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