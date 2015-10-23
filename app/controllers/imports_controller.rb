class ImportsController < ApplicationController

  def new
    @import = Import.new
  end

  # Pour l'importation d'un fichier BibTeX et son traitement.
  def create
    # Récupère le fichier et l'enregistre temporairement en BDD
    @import = Import.new(import_params)
    # Récupère le nom du fichier .bib sans l'extension.
    @fName = @import.attachment.to_s.split('/').last.split('.').first
    # Parse le fichier .bib et l'enregistre dans une variable.
    @bib = BibTeX.open("./public/#{@import.attachment.to_s}")

    # Si l'utilisateur spécifie un nom pour une nouvelle collection 
    if @import.new_collection != ""
      # Si l'utilisateur est enregistré, on créer cette collection
      if !current_user.nil?
        User.where(:id => current_user.id).first.resource_collections << ResourceCollection.create(:user_id => current_user.id, :collection_name => @import.new_collection)
      end
    end
   
    # Tant que le fichier contient des entrées bibtex (surrogate)...
    i = 0
    while @bib[i] != nil do
      # ... Convertie l'entrée bibtex en string
      @entry = @bib[i].to_s
      # Si l'utilisateur n'est pas enregistré
      if current_user.nil? 
        # On enregistre les surrogates dans la collection par défaut
        ResourceCollection.where(:collection_name => "Default").first.surrogates << Surrogate.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
      # Sinon, s'il est enregistré
      else
        # Si l'utilisateur sélectionne une collection 
        if @import.collection_id != nil
          # Et s'il entre un nom de nouvelle collection
          if @import.new_collection != ""
            # On enregistre ces surrogates dans la nouvelle collection
	    # et non pas dans celle sélectionnée.
            ResourceCollection.where(:user_id => current_user.id, :collection_name => @import.new_collection).first.surrogates << Surrogate.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
          # S'il n'entre pas de nom de nouvelle collection
          else 
	    # On enregistre ces surrogates dans la collection sélectionnée.
	    ResourceCollection.where(:id => @import.collection_id).first.surrogates << Surrogate.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
          end
        # Si l'utilisateur ne sélectionne pas de collection
        # mais spécifie un nom de nouvelle collection
        elsif @import.new_collection != ""
          #On enregistre les surrogates dans la nouvelle collection.
          ResourceCollection.where(:user_id => current_user.id, :collection_name => @import.new_collection).first.surrogates << Surrogate.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
        # Sinon, si l'utilisateur n'a rien spécifié on enregistre
        # les surrogates dans la collection par défaut.
        else
          ResourceCollection.where(:collection_name => "Default").first.surrogates << Surrogate.create(:entry_type => @bib[i].type, :entry_key => @bib[i].key, :doi => @bib[i]['doi'], :url => @bib[i]['url'])
        end
      end
      
      @srg = Surrogate.last
      # ... Parcours chaque champs d'une entrée
      j = 0
      while @bib[i].entries[j] != nil do
        @type = 0
        # Enregistre le nom du champ s'il existe
        if (@sField = @bib[i].entries[j].to_s.split('"')[0].split(/\W+/)[1]).nil?
	  @sField = @bib[i].entries[j].to_s.split('"')[1]
          @type = 1
	end
	k = 0 
        # Si le champ parcouru est le champ keyword on récupère les
	# valeurs entre les séparateurs "," et ";"
	if @sField === "keywords"
	  @sValue = @bib[i].entries[j].to_s.split('"')[1].split(/;|,/)
        # Si le champ parcouru est le champ author ou editor on
	# spécifie la façon de récupérer correctement les noms.
	elsif @sField === "author" || @sField === "editor"
	  @sValue = @bib[i].entries[j].to_s.split('"').delete_if{|e| e === ", "}.delete_if{|e| e === ">]"}
	  k = 1 
        # Si le champ parcouru est le champ month on récupère sa
	# valeur (cette partie est un bug fix de la librairie)
	elsif @sField === "month"
	  @sValue = @bib[i].entries[j].to_s.split(/:|>/)[4].split("",1)
        # Si le champ parcouru est le champ abstract on fait attention
	# à ne pas couper le résumé en morceaux à cause des vigules.
	elsif @sField === "abstract"
	  @sValue = @bib[i].entries[j].to_s.split('"')
	  k = 1 
	# Par défaut on considère que les différentes valeurs sont 
	# séparées pas des virgules.
	elsif @type === 1 
          @sValue = @bib[i].entries[j].to_s.split('"')[3].split(',')
	else
          @sValue = @bib[i].entries[j].to_s.split('"')[1].split(',')
	end
	# On sauvegarde le champ keyword pour créer les tags après avoir
	# traité le reste.
	@sKeywords = @bib[i]['keywords'].to_s.split(/;|,/)
        # Enregistre le surrogateElement dans la BDD
        @srgElmt = @srg.surrogate_elements.create(:field_name => @sField)
        # Enregistre tout les valeurs du champ parcouru dans la BDD
	while @sValue[k] != nil do
          @seValue = @srgElmt.se_values.create(:value => @sValue[k].strip, :surrogate_id => @srgElmt.surrogate_id)
          k = k+1
	end # While end
        j = j+1
      end # While End
      k = 1
      while @sKeywords[k] != nil do
        @keyword = @srg.keywords.create(:keywordName => @sKeywords[k].strip)
        @tag = @srg.tag_list.add(@sKeywords[k].strip)
        k = k+1
      end # While End
      @srg.save
      i = i+1
    end # While end

    # Supprime les fichiers temporaires (.bib)
    FileUtils.rm_rf(Dir.glob('./public/uploads/tmp/*'))
    # Renvoie sur la page de navigation
    redirect_to surrogates_path, notice: "The BibTeX file #{@fName}.bib has been imported. Thank you for your contribution"
  end

#------ INACTIF ------#

  # Supprimer un fichier .bib
  def destroy
    @import = Import.find(params[:id])
    @import.destroy
    redirect_to surrogates_path, notice: "The BibTeX file #{@fName}.bib has been removed."
  end

  # Définie les champs modifiable de IMPORT 
  private def import_params
    params.require(:import).permit(:attachment, :collection_id, :new_collection)
  end

  # Définie les champs modifiable de SURROGATE
  private def surrogate_params
    params.require(:surrogate).permit(:entry_key, :entry_type, :doi, :url)
  end

  # Définie les champs modifiable de SURROGATE_ELEMENT
  private def surrogateElement_params
    params.require(:surrogateElement).permit(:field_name)
  end

  # Définie les champs modifiable de SE_VALUE
  private def seValues_params
    params.require(:seValues).permit(:value)
  end
end
