class Product < ActiveRecord::Base
  has_many :variants, -> {order :price}

  validates :title, presence: true
end
