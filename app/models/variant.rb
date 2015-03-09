class Variant < ActiveRecord::Base
  belongs_to :product

  validates :price, :quantity, presence: true
end
