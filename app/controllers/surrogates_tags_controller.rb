class SurrogatesTagsController < ApplicationController
  before_action :set_surrogates_tag, only: [:show, :edit, :update, :destroy]

  # GET /surrogates_tags
  # GET /surrogates_tags.json
  def index
    @surrogates_tags = SurrogatesTag.all
  end

  # GET /surrogates_tags/1
  # GET /surrogates_tags/1.json
  def show
  end

  # GET /surrogates_tags/new
  def new
    @surrogates_tag = SurrogatesTag.new
  end

  # GET /surrogates_tags/1/edit
  def edit
  end

  # POST /surrogates_tags
  # POST /surrogates_tags.json
  def create
    @surrogates_tag = SurrogatesTag.new(surrogates_tag_params)

    respond_to do |format|
      if @surrogates_tag.save
        format.html { redirect_to @surrogates_tag, notice: 'Surrogates tag was successfully created.' }
        format.json { render :show, status: :created, location: @surrogates_tag }
      else
        format.html { render :new }
        format.json { render json: @surrogates_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surrogates_tags/1
  # PATCH/PUT /surrogates_tags/1.json
  def update
    respond_to do |format|
      if @surrogates_tag.update(surrogates_tag_params)
        format.html { redirect_to @surrogates_tag, notice: 'Surrogates tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @surrogates_tag }
      else
        format.html { render :edit }
        format.json { render json: @surrogates_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surrogates_tags/1
  # DELETE /surrogates_tags/1.json
  def destroy
    @surrogates_tag.destroy
    respond_to do |format|
      format.html { redirect_to surrogates_tags_url, notice: 'Surrogates tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surrogates_tag
      @surrogates_tag = SurrogatesTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surrogates_tag_params
      params[:surrogates_tag]
    end
end
