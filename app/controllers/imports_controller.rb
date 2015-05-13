class ImportsController < ApplicationController
  def index
    @imports = Import.all
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    @fName = @import.attachment.to_s.split('/').last.split('.').first
    @uniqID = ('a'..'z').to_a.shuffle[0..7].join
    if @import.save
      redirect_to imports_path, notice: "The BibTeX file #{@fName}.bib has been imported."
      @bib = BibTeX.open("./public/#{@import.attachment.to_s}")
      i = 0
      while @bib[i] != nil do
        @entry = @bib[i].to_s
        File.open("./public/uploads/import/attachment/surrogates/#{@fName}-entry#{i}.srg", 'w+') { |f| f.write(@entry) }
        i = i+1
      end
      FileUtils.rm_r("./public/uploads/import/attachment/tmp/#{@import.attachment.to_s.split('/')[-2]}")
    else
      render "new"
    end
  end

  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to imports_path, notice: "The BibTeX file #{@fName}.bib has been removed."
  end

  private def import_params
    params.require(:import).permit(:attachment)
  end
end
