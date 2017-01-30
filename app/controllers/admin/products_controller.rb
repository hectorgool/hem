class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
    @product.attachments.build
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @product = Product.new(product_params)
    @product.approved = true
    @product.user = current_user
    @product.category_id = params[:category_id]
    if @product.save
      flash[:notice] = "Product has been created."
      redirect_to @product
    else
      flash.now[:alert] = "Product has not been created."
      render "new"
    end
  end

  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product has been updated."
      redirect_to @product
    else
      flash.now[:alert] = "Product has not been updated."
      render "edit"
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product has been deleted."
    redirect_to products_path
  end

  private

    def set_product
      @product = Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The product you were looking for could not be found."
      redirect_to products_path
    end 
  
    def product_params
      params.require(:product).permit(:name, :description, :price, :approved, :category_id, attachments_attributes: [:file, :file_cache])    
    end

end
