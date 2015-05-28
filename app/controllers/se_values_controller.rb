class SeValuesController < ApplicationController
  before_action :set_se_value, only: [:show, :edit, :update, :destroy]

  # GET /se_values
  # GET /se_values.json
  def index
    @se_values = SeValue.all
  end

  # GET /se_values/1
  # GET /se_values/1.json
  def show
  end

  # GET /se_values/new
  def new
    @se_value = SeValue.new
  end

  # GET /se_values/1/edit
  def edit
  end

  # POST /se_values
  # POST /se_values.json
  def create
    @se_value = SeValue.new(se_value_params)

    respond_to do |format|
      if @se_value.save
        format.html { redirect_to @se_value, notice: 'Se value was successfully created.' }
        format.json { render :show, status: :created, location: @se_value }
      else
        format.html { render :new }
        format.json { render json: @se_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /se_values/1
  # PATCH/PUT /se_values/1.json
  def update
    respond_to do |format|
      if @se_value.update(se_value_params)
        format.html { redirect_to @se_value, notice: 'Se value was successfully updated.' }
        format.json { render :show, status: :ok, location: @se_value }
      else
        format.html { render :edit }
        format.json { render json: @se_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /se_values/1
  # DELETE /se_values/1.json
  def destroy
    @se_value.destroy
    respond_to do |format|
      format.html { redirect_to se_values_url, notice: 'Se value was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_se_value
      @se_value = SeValue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def se_value_params
      params[:se_value]
    end
end
