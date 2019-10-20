# frozen_string_literal: true

class AddCountToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :count, :integer
  end
end
