json.extract! order, :id, :order_number, :first_name, :last_name, :address, :city, :zip, :country, :phone, :card_number, :name_on_card, :mm_yy, :cvv, :created_at, :updated_at
json.url order_url(order, format: :json)