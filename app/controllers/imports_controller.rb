class ImportsController < ApplicationController

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    # Récupère le nom du fichier .bib sans l'extension.
    @fName = @import.attachment.to_s.split('/').last.split('.').first
    # Renvoie sur la page d'acceuil
    redirect_to surrogates_path, notice: "The BibTeX file #{@fName}.bib has been imported. Thank you for your contribution"
    # Parse le fichier .bib et l'enregistre dans une variable.
    @bib = BibTeX.open("./public/#{@import.attachment.to_s}")
    # Tant que le fichier contient des entrées bibtex (surrogate)...
    i = 0
    while @bib[i] != nil do
      # ... Convertie l'entrée bibtex en string
      @entry = @bib[i].to_s
      # ... Enregistre le surrogate dans la BDD.
      @srg = Surrogate.new(:name => @bib[i].title, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
      j = 0
      # ... Parcours chaque champs
      while @bib[i].entries[j] != nil do
        # Valeurs d'un champs
        @sValue = @bib[i].entries[j].to_s.split('"')[1]
        # Nom du champ
        @sField = @bib[i].entries[j].to_s.split('"')[0].split(/\W+/)[1]
        # Enregistre le surrogateElement dans la BDD si différent de doi ou url
        if @sField === "doi" || @sField === "url"
        else
          @srgElmt = SurrogateElement.new(:name => @bib[i].title, :field => @sField, :arrayValues => @sValue)
          # commit dans la BDD
          @srgElmt.save
        end
        j = j+1
      end
      # commit dans la BDD
      @srg.save
      i = i+1
    end
    # Supprime les fichiers temporaires (.bib)
    FileUtils.rm_rf(Dir.glob('./public/uploads/tmp/*'))
  end

  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to surrogates_path, notice: "The BibTeX file #{@fName}.bib has been removed."
  end

  private def import_params
    params.require(:import).permit(:attachment)
  end

  private def surrogate_params
    params.require(:surrogate).permit(:name, :doi, :url)
  end

  private def surrogateElement_params
    params.require(:surrogateElement).permit(:name, :field,  :arrayValues)
  end
end
