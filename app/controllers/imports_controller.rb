class ImportsController < ApplicationController
  def index
    @imports = Import.all
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    if @import.save
      redirect_to imports_path, notice: "The BibTeX file #{@import.attachment.to_s.split('/').last} has been imported."
    else
      render "new"
    end
  end

  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to imports_path, notice: "The BibTeX file #{@import.attachment.to_s.split('/').last} has been removed."
  end

  private def import_params
    params.require(:import).permit(:attachment)
  end
end
