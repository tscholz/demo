class PurchasesController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @variant = @product.variants.first
    current_buyer.credits -= @variant.price
    if current_buyer.save
      @variant.decrement! :quantity
      flash[:notice] = "You bought it!"
    end

    redirect_to products_path
  end

end
