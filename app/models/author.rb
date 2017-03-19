class Author < ApplicationRecord
	has_many :products, dependent: :destroy

	validates :first_name, :last_name, presence: true
end
