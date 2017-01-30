class Admin::CategoriesController < ApplicationController

  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.order(:name).page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "Category has not been created."
      render "new"
    end
  end

  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def edit
    #@category.attachments.build
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category has been updated."
      redirect_to admin_categories_path
    else
      flash.now[:alert] = "Category has not been updated."
      render "edit"
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category has been deleted."
    redirect_to categories_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
