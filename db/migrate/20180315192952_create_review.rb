# frozen_string_literal: true

class CreateReview < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :product, foreign_key: true
      t.references :user # , foreign_key: true
      t.text :text
      t.float :rating
    end
  end
end
