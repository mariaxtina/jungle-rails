class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :rating, presence: true
  validates :user, presence: true
  validates :product_id, presence: true

end
