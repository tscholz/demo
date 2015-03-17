class Variant < ActiveRecord::Base
  belongs_to :product
  has_many :coupons

  validates :price, :quantity, presence: true
  validates :quantity, numericality: {greater_than_or_equal_to: 0}

  scope :active, ->{ where(is_active: true) }

  def purchase(count: 1)
    self.quantity -= count
  end
end
