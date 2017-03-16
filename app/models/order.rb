class Order < ApplicationRecord
	has_many :line_items, dependent: :destroy
	belongs_to :user
	
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end

	def total_cupon
		@cupon = Cupon.find(self.cupon_id)
		@cupon.price
	end

	def total_delivery
		@delivery = Delivery.find(self.delivery_id)
		@delivery.price
	end
end
