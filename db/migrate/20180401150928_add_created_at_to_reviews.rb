class AddCreatedAtToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :created_at, :datetime
  end
end
