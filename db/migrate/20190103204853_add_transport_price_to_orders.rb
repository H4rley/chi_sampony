# frozen_string_literal: true

class AddTransportPriceToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :transport_price, :float
    add_column :orders, :payment_price, :float
  end
end
