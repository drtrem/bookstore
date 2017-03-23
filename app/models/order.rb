class Order < ApplicationRecord
	include AASM

	has_many :line_items, dependent: :destroy
	belongs_to :user

	validates :card_number, :name_on_card, :mm_yy, :cvv, presence: true
  validates :card_number, length: { minimum: 10 }, format: { with: /\A[0-9]+\z/, message: "please enter a valid credit card number" }
  validates :name_on_card, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :mm_yy, format: { with: /\A(0{1}([0-9]){1}|1{1}([0-2]){1})\/\d{2}\z/, message: "the expiration date must be MM/YY" }
  validates :cvv, length: { maximum: 4 }

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
