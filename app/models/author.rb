class Author < ApplicationRecord
	has_many :products, dependent: :destroy
end
