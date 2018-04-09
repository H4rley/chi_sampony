class Review < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :product, optional: true

	validates_presence_of :rating
end