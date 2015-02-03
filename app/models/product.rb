class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews
  validates :description, presence: true
  validates :price, presence: true, numericality: true, 
                    format: { with: /\A\d+\.?\d{0,2}\z/, message: "price is limited to two decimal places" }
  validates :title, presence: true

  # Return calculated average rating or 0.0 if no ratings.
  def average_rating
    reviews.average("rating").to_f.round(1)
  end
end
