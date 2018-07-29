class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @categories = Category.all
    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
    
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:notice] = "Category was successfully created"
        redirect_to admin_categories_path
      else
        @categories = Category.all
        render :index
      end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "Category was successfull update"
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category was successfully deleted"
    redirect_to admin_categories_path
  end


end



private

  def category_params
  params.require(:category).permit(:name)
    
  end

