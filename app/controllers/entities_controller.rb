class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @entity = Entity.all
  end

  def show
    @category = Category.find(params[:category_id])
    @entities = @category.entities.find(params[:id])
  end

  def new
    @entity = Entity.new
    @category = Category.find(params[:category_id])
  end

  def edit; end

  # post/entities
  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user

    if @entity.save
      redirect_to entities_path(id: @entity.user_id)
      flash[:notice] = 'Transaction added successfully!'
    else
      render :new
      flash[:alert] = 'Error, transaction not added'
    end
  end

  def update
    if @entity.update(entity_params)
      redirect_to @entity
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record = set_record
    @record.destroy
    redirect_to entities_url
  end

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end

  private :entity_params, :set_entity

end
