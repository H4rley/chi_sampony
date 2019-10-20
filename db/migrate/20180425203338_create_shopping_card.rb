# frozen_string_literal: true

class CreateShoppingCard < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cards do |t|
      t.references :user, foreign_key: true
    end
  end
end
