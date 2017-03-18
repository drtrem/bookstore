class Order < ApplicationRecord
	include AASM
	has_many :line_items, dependent: :destroy
	belongs_to :user

	aasm :column => 'state' do
		state :in_progress, :initial => true
    state :in_queued
    state :in_delivered
    state :delivered
    state :canceled

    event :in_queue do
      transitions :from => :in_progress, :to => :in_queued
    end

    event :in_delivery do
      transitions :from => :in_queue, :to => :in_delivered
    end

    event :delivery do
      transitions :from => :in_delivery, :to => :delivered
    end

    event :cancel do
      transitions :from => [:in_queue, :in_delivery, :delivered], :to => :canceled
    end
  end
	
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
