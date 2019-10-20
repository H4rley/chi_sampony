# frozen_string_literal: true

class CreateAdresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :country
      t.integer :postal_code
      t.integer :house_number
      t.integer :telephone_number
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
