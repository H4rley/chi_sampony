# frozen_string_literal: true

class CreateTransports < ActiveRecord::Migration[5.1]
  def change
    create_table :transports do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
