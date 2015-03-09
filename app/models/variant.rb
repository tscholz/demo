class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :coupons

  validates :price, :quantity, presence: true

  scope :active, ->{ where(is_active: true) }
end
