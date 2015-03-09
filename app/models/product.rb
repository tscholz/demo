class Product < ActiveRecord::Base
  has_many :variants, -> {order :price}
  has_one :cheapest, -> {active.order :price}, class_name: 'Variant'

  validates :title, presence: true

  scope :active, -> { includes(:variants).where(variants: {is_active: true}) }

  delegate :price, to: :cheapest
end
