class Product < ActiveRecord::Base
  has_many :variants, -> {order :price}

  validates :title, presence: true

  scope :active, -> { includes(:variants).where(variants: {is_active: true}) }
end
