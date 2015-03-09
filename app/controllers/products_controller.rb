class ProductsController < ApplicationController

  def index
    @products = Product.active
  end

end
