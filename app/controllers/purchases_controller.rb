class PurchasesController < ApplicationController

  def create
    @purchase = Purchase.build variant: variant, buyer: current_buyer

    if @purchase.save
      flash[:notice] = "You bought it!"
    else
      flash[:warning] = "You don't have enouth cash to buy this!"
    end

    redirect_to products_path
  end


  private
  def variant
    Product.find(params[:product_id]).cheapest
  end
end
