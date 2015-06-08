class FacetLeafsController < ApplicationController
  before_action :set_facet_leaf, only: [:show, :edit, :update, :destroy]

  # GET /facet_leafs
  # GET /facet_leafs.json
  def index
    @facet_leafs = FacetLeaf.all
  end

  # GET /facet_leafs/1
  # GET /facet_leafs/1.json
  def show
  end

  # GET /facet_leafs/new
  def new
    @facet_leaf = FacetLeaf.new
  end

  # GET /facet_leafs/1/edit
  def edit
  end

  # POST /facet_leafs
  # POST /facet_leafs.json
  def create
    @facet_leaf = FacetLeaf.new(facet_leaf_params)

    respond_to do |format|
      if @facet_leaf.save
        format.html { redirect_to @facet_leaf, notice: 'Facet leaf was successfully created.' }
        format.json { render :show, status: :created, location: @facet_leaf }
      else
        format.html { render :new }
        format.json { render json: @facet_leaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facet_leafs/1
  # PATCH/PUT /facet_leafs/1.json
  def update
    respond_to do |format|
      if @facet_leaf.update(facet_leaf_params)
        format.html { redirect_to @facet_leaf, notice: 'Facet leaf was successfully updated.' }
        format.json { render :show, status: :ok, location: @facet_leaf }
      else
        format.html { render :edit }
        format.json { render json: @facet_leaf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facet_leafs/1
  # DELETE /facet_leafs/1.json
  def destroy
    @facet_leaf.destroy
    respond_to do |format|
      format.html { redirect_to facet_leafs_url, notice: 'Facet leaf was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facet_leaf
      @facet_leaf = FacetLeaf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facet_leaf_params
      params.require(:facet_leaf).permit(:facet_id)
    end
end
