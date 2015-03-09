class PurchasesController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @variant = @product.variants.first
    current_buyer.credits -= @variant.price

    if current_buyer.save
      @variant.decrement! :quantity
      @variant.coupons.create!
      flash[:notice] = "You bought it!"
    else
      flash[:warning] = "You don't have enouth cash to by this!"
    end

    redirect_to products_path
  end
end
