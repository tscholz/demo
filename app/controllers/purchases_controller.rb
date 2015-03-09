class PurchasesController < ApplicationController

  def create
    @purchase = Product.find(params[:product_id]).cheapest
    current_buyer.buy_for @purchase.price

    if current_buyer.save
      update_purchase!
      flash[:notice] = "You bought it!"
    else
      flash[:warning] = "You don't have enouth cash to buy this!"
    end

    redirect_to products_path
  end


  private
  def update_purchase!
    @purchase.decrement! :quantity
    @purchase.coupons.create!
  end
end
