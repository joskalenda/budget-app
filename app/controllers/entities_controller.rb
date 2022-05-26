class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @entities = Entity.all
  end

  def show
    @category = Category.find(params[:category_id])
    @entity = @category.entities.find(params[:id])
    # @entity = @category.entities.order(created_at: :desc)

  end

  def new
    @category = Category.find(params[:category_id])
    @entity = Entity.new

  end

  def edit; end

  # post/entities
  # def create
  #   @category = Category.find(params[:category_id])
  #   @entity = Entity.new(entity_params)
  #   # @entity.user = current_user
  #   @entity.user_id = current_user.id
  #   @entity.save!
  #   category_entity = @category.category_entities.new(entity: @entity)
  #   # @entity.category_entities = @category
  #   # @entity.category_entities << @category.id 
  #   CategoryEntity.create!(entity_id: @entity.id , category_id: @category.id) 
  
  #   respond_to do |format|
  #     if category_entity.save
  #       format.html { redirect_to category_url(@category), notice: 'Transaction was successfully created.' }
  
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @category = Category.find(params[:category_id])
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    @entity.save!
    category_record = @category.category_entities.new(entity: @entity)
    # OR category_record = CategoryRecord.create!(category: @category, record: @record)

    respond_to do |format|
      if category_record.save
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
