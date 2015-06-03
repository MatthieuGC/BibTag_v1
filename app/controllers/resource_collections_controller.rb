class ResourceCollectionsController < ApplicationController
  before_action :set_resource_collection, only: [:show, :edit, :update, :destroy]

  # GET /resource_collections
  # GET /resource_collections.json
  def index
    @resource_collections = ResourceCollection.all
  end

  # GET /resource_collections/1
  # GET /resource_collections/1.json
  def show
  end

  # GET /resource_collections/new
  def new
    @resource_collection = ResourceCollection.new
  end

  # GET /resource_collections/1/edit
  def edit
  end

  # POST /resource_collections
  # POST /resource_collections.json
  def create
    @resource_collection = ResourceCollection.new(resource_collection_params)

    respond_to do |format|
      if @resource_collection.save
        format.html { redirect_to @resource_collection, notice: 'Resource collection was successfully created.' }
        format.json { render :show, status: :created, location: @resource_collection }
      else
        format.html { render :new }
        format.json { render json: @resource_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_collections/1
  # PATCH/PUT /resource_collections/1.json
  def update
    respond_to do |format|
      if @resource_collection.update(resource_collection_params)
        format.html { redirect_to @resource_collection, notice: 'Resource collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource_collection }
      else
        format.html { render :edit }
        format.json { render json: @resource_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_collections/1
  # DELETE /resource_collections/1.json
  def destroy
    @resource_collection.destroy
    respond_to do |format|
      format.html { redirect_to resource_collections_url, notice: 'Resource collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_collection
      @resource_collection = ResourceCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_collection_params
      params.require(:resource_collection).permit(:user_id, :collection_name)
    end
end
