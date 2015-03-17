class Purchase
  include ActiveModel::Model

  attr_accessor :buyer, :variant

  validates :buyer, :variant, presence: true
  validates_with ActiveRecord::Validations::AssociatedValidator,
            attributes: [:buyer, :variant]

  def self.build(attributes = nil)
    p = new(attributes)
    p.purchase
    p
  end

  def save
    if valid?
      buyer.save! && variant.save! && create_coupon!
    end
  end

  def purchase
    balance_credits
    balance_quantity
    self
  end


  private

  def balance_credits
    buyer.buy_for variant.price
  end

  def balance_quantity
    variant.purchase count: 1
  end

  def create_coupon!
    variant.coupons.create!
  end
end
