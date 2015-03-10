class ProductsController < ApplicationController

  skip_before_action :authenticate_buyer!

  def index
    @products = Product.active
  end

end
