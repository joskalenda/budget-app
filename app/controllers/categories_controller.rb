class CategoriesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  
  # GET /categories
  def index
    @categories = current_user.categories.order(created_at: :desc)
  end

  # GET /categories/1
  def show
    @entity = @category.entities.order(created_at: :desc)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category = set_category
    @category.destroy
    redirect_to categories_url
  end

  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name, :icon)
  end

  private :set_category, :category_params
end
