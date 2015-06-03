class ImportsController < ApplicationController

  def new
    @import = Import.new
  end

  def create
    @import = Import.new(import_params)
    if @import.new_collection != ""
      ResourceCollection.create(:user_id => current_user.id, :collection_name => @import.new_collection)
    end
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
      if @import.collection_id != nil
        if @import.new_collection != ""
          @srg = ResourceCollection.where(:user_id => current_user.id, :collection_name => @import.new_collection).first.surrogates.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
        else 
	  @srg = ResourceCollection.where(:id => @import.collection_id).first.surrogates.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
        end
      elsif @import.new_collection != ""
        @srg = ResourceCollection.where(:user_id => current_user.id, :collection_name => @import.new_collection).first.surrogates.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
      else
        @srg = ResourceCollection.where(:collection_name => "Default").first.surrogates.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
      end 
      j = 0
      # ... Parcours chaque champs
      while @bib[i].entries[j] != nil do
        # Nom du champ
        @sField = @bib[i].entries[j].to_s.split('"')[0].split(/\W+/)[1]
	k = 0
        # Valeurs d'un champs
	if @sField === "keywords"
	  @sValue = @bib[i].entries[j].to_s.split('"')[1].split(/;|,/)
	elsif @sField === "author" || @sField === "editor"
	  @sValue = @bib[i].entries[j].to_s.split('"').delete_if{|e| e === ", "}.delete_if{|e| e === ">]"}
          k = 1
	elsif @sField === "month"
	  @sValue = @bib[i].entries[j].to_s.split(/:|>/)[4].split("",1)
	else
          @sValue = @bib[i].entries[j].to_s.split('"')[1].split(',')
	end
	# Valeurs du champ keywords
	@sKeywords = @bib[i]['keywords'].to_s.split(/;|,/)
        # Enregistre le surrogateElement dans la BDD si différent de doi ou url
        if @sField === "doi" || @sField === "url"
        else
          @srgElmt = @srg.surrogate_elements.create(:field_name => @sField)
	  while @sValue[k] != nil do
            @seValue = @srgElmt.se_values.create(:value => @sValue[k].strip)
            k = k+1
	  end
	  k = 0
        end
        j = j+1
      end
      while @sKeywords[k] != nil do
        @keyword = @srg.keywords.create(:keywordName => @sKeywords[k].strip)
        @tag = @srg.tag_list.add(@sKeywords[k].strip)
        k = k+1
      end
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
    params.require(:import).permit(:attachment, :collection_id, :new_collection)
  end

  private def surrogate_params
    params.require(:surrogate).permit(:entry_key, :entry_type, :doi, :url)
  end

  private def surrogateElement_params
    params.require(:surrogateElement).permit(:field_name)
  end

  private def seValues_params
    params.require(:seValues).permit(:value)
  end
end
