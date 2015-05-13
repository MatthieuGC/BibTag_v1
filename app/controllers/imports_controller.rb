class ImportsController < ApplicationController
  def index
    @imports = Import.all
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    # Récupère le nom du fichier .bib sans l'extension.
    @fName = @import.attachment.to_s.split('/').last.split('.').first
    # Si l'importation du fichier .bib est réussie
    #if @import.save
      # Renvoie sur la page d'acceuil
      redirect_to imports_path, notice: "The BibTeX file #{@fName}.bib has been imported."
      # Parse le fichier .bib et l'enregistre dans une variable.
      @bib = BibTeX.open("./public/#{@import.attachment.to_s}")
      # Tant que le fichier contient des entrées bibtex (surrogate)...
      i = 0
      while @bib[i] != nil do
        # Convertie l'entrée bibtex en string
        @entry = @bib[i].to_s
        # ... enregistrer le surrogate dans la BDD avec nom du fichier .bib et contenu de l'entrée i.
        @srg = Surrogate.new(:name => "#{@fName}-srg#{i}", :doi => @entry, :url => "coucou")
        # commit dans la BDD
        @srg.save
        # Dans le cas ou l'on souhaiterai conserver les surrogates physiquement, on les enregistre dans des fichier .srg
        File.open("./public/uploads/surrogates/#{@fName}-entry#{i}.srg", 'w+') { |f| f.write(@entry) }
        i = i+1
      end
      # On supprime les fichiers/dossiers temporaires (bibtex)
      # FileUtils.rm_r("./public/uploads/import/attachment/tmp/#{@import.attachment.to_s.split('/')[-2]}")
    #else # Sinon recharge la page
    #  render "new"
    #end
  end

  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to imports_path, notice: "The BibTeX file #{@fName}.bib has been removed."
  end

  private def import_params
    params.require(:import).permit(:attachment)
  end

  private def surrogate_params
    params.require(:surrogate).permit(:name, :doi, :url)
  end
end
