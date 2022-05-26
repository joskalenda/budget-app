class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]
  before_action :authenticate_user!
  load_and_authorize_resource :category

  def index
    @entities = Entity.all
  end

  def show
    @category = Category.find(params[:category_id])
    @entity = @category.entities.find(params[:id])
  end

  def new
    @entity = Entity.new
    @category = Category.find(params[:category_id])
  end

  def edit; end

  # post/entities
  def create
    @category = Category.find(params[:category_id])
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    # @record.user_id = current_user.id
    @entity.save!
    category_entity = @category.category_entities.new(entity: @entity)
    
    respond_to do |format|
      if category_entity.save
        format.html { redirect_to category_url(@category), notice: 'Transaction was successfully created.' }
  
      else
        format.html { render :new, status: :unprocessable_entity }
      end
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
