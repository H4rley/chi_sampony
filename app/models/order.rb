# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :address
  belongs_to :transport
  belongs_to :payment
  has_many :order_items
end
