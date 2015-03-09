class Coupon < ActiveRecord::Base
  belongs_to :variant

  validates :code, presence: true

  after_initialize do
    self.code ||= SecureRandom.uuid
  end
end
