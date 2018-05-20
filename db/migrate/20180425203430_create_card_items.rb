class CreateCardItems < ActiveRecord::Migration[5.1]
  def change
    create_table :card_items do |t|
      t.references :shopping_card, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
