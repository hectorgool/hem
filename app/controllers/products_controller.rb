class ProductsController < ApplicationController

	def index
    @products = Product.last(12).reverse
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end  
  end

end
