class Buyer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable
        #, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :credits, numericality: {greater_than_or_equal_to: 0}


  def buy_for(price)
    self.credits -= price
  end
end
