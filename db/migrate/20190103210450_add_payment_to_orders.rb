# frozen_string_literal: true

class AddPaymentToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :payment, foreign_key: true
    add_reference :orders, :transport, foreign_key: true
  end
end
