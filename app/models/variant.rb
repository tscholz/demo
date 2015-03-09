class Variant < ActiveRecord::Base
  belongs_to :product

  validates :price, :quantity, presence: true

  # scope :active, ->{ is_active: true }
end
