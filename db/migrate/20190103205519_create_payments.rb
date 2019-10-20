# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
