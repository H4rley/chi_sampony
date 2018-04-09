class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", mini: "50x50" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :reviews

  def avg_rating
  	return 0 unless reviews.present?
  	ratings = reviews.pluck(:rating)
  	ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
  end
end
