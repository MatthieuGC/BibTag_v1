class HeadingsController < ApplicationController
  before_action :set_heading, only: [:show, :edit, :update, :destroy]

  # GET /headings
  # GET /headings.json
  def index
    @headings = Heading.all
  end

  # GET /headings/1
  # GET /headings/1.json
  def show
  end

  # GET /headings/new
  def new
    @heading = Heading.new
  end

  # GET /headings/1/edit
  def edit
  end

  # POST /headings
  # POST /headings.json
  def create
    @heading = Heading.new(heading_params)

    respond_to do |format|
      if @heading.save
        format.html { redirect_to @heading, notice: 'Heading was successfully created.' }
        format.json { render :show, status: :created, location: @heading }
      else
        format.html { render :new }
        format.json { render json: @heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headings/1
  # PATCH/PUT /headings/1.json
  def update
    respond_to do |format|
      if @heading.update(heading_params)
        format.html { redirect_to @heading, notice: 'Heading was successfully updated.' }
        format.json { render :show, status: :ok, location: @heading }
      else
        format.html { render :edit }
        format.json { render json: @heading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headings/1
  # DELETE /headings/1.json
  def destroy
    @heading.destroy
    respond_to do |format|
      format.html { redirect_to headings_url, notice: 'Heading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heading
      @heading = Heading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heading_params
      params.require(:heading).permit(:heading_name, :facet_id)
    end
end
