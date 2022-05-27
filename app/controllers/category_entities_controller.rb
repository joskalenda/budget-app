class CategoryEntitiesController < ApplicationController
  before_action :set_category_entity, only: %i[show edit update destroy]

  # GET /category_records or /category_records.json
  def index
    @category_entities = CategoryEntity.all
  end

  # GET /category_records/1 or /category_records/1.json
  def show; end

  # GET /category_records/new
  def new
    @category_entity = CategoryEntity.new
  end

  # GET /category_records/1/edit
  def edit; end

  # POST /category_records or /category_records.json
  def create
    @category_entity = CategoryEntity.new(category_entity_params)

    respond_to do |format|
      if @category_entity.save
        format.html do
          redirect_to category_entity_url(@category_entity), notice: 'Category entity was successfully created.'
        end
        format.json { render :show, status: :created, location: @category_entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_records/1 or /category_records/1.json
  def update
    respond_to do |format|
      if @category_entity.update(category_entity_params)
        format.html do
          redirect_to category_entity_url(@category_entity), notice: 'Category record was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @category_entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_records/1 or /category_records/1.json
  def destroy
    @category_entity = set_category_entity
    @category_entity.destroy
    # redirect_to category_entities_url

    respond_to do |format|
      format.html { redirect_to category_entities_url, notice: 'Category record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_category_entity
    @category_entity = CategoryEntity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_entity_params
    params.require(:category_entity).permit(:category_id, :entity_id)
  end

  private :set_category_entity, :category_entity_params
end
