# frozen_string_literal: true

class CardItem < ApplicationRecord
  belongs_to :shopping_card
  belongs_to :product
end
