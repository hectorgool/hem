class ProductsController < ApplicationController

	def index
    #@products = Product.last(12).reverse
    @products = Product.order(:name).page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end  
  end

end
