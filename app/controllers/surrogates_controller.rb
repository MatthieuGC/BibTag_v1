class SurrogatesController < ApplicationController
  # Pour la navigation 
  def index

#------ INITIALIZATION ------#
    
    # TEMPORAIRE // On récupère toutes les facettes (classification unique)
    # et toutes les descriptions.
    @facets = Facet.all
    @surrogates = Surrogate.all

    # Variable d'incrémentation
    @i = 0

    # Tableau pour se remémorer le chemin parcouru via les facettes
    @pathRemember = []

    # Initialise deux chaines de caractères pour l'affichage
    # > Collection sélectionnée
    @colName = ""
    # > Mot/phrase utilisée pour la recherche
    @search = ""

#------------#

#-------- NAVIGATION --------#

    # Si l'utilisateur sélectionne un heading dans le chemin parcouru
    if params[:heading]
      # On sélectionne les surrogates correspondants
      @surrogates = @surrogates & Surrogate.joins(:headings).where("headings.heading_name = '#{params[:heading]}'")
      # On déclare une variable d'arret
      @ok = 1
      # Tant que i est inférieur à la longueur du tableau de parcours
      while @i < @pathRemember.length
        # On vérifie si le headings n'est pas déjà dans le teableau
        if @pathRemember[@i].to_s === params[:heading].to_s
	  @ok = 0
	end
	@i = @i +1
      end # While End
      # Si le heading n'est pas déjà dans le tableau
      if @ok === 1
        # On ajoute le heading sélectionné au tableau de parcours
	@pathRemember<<params[:heading]
      end
    end

    # Tant que i est inférieur au nombre de headings
    while @i <= Heading.count
      # Si l'utilisateur à sélectionné le heading i
      if params[":heading"+"#{@i}"]

  ##------ VERIFIE QUE LE CHEMIN N'EXISTE PAS DEJA ------##

        # On déclare une variable d'arret et d'incrémentation
        @ok = 1
	@j = 0
        # Tant que i est inférieur à la longueur du tableau de parcours
        while @j < @pathRemember.length
          # On vérifie si le headings n'est pas déjà dans le teableau
          if @pathRemember[@j].to_s === params[":heading"+"#{@i}"].to_s
	    @ok = 0
	  end
	  @j = @j +1
        end # While End
	# Si le heading n'est pas déjà dans le tableau
        if @ok === 1
          # On ajoute le heading sélectionné au tableau de parcours.
          @pathRemember<<params[":heading"+"#{@i}"]
        end

  ##------------##

	# Les surrogates à afficher sont ceux liés à ce heading (+ les précédents)
        @surrogates = @surrogates & Surrogate.joins(:headings).where("headings.heading_name = '#{params[":heading"+"#{@i}"]}'")
      end
      # Incrémentation
      @i = @i + 1
      
      # Si l'utilisateur utilise le champs de recherche manuel
      if !params[:search].blank?
        # On enregistré son entré pour l'affichage
        @search = "> "+params[:search]
	# Les surrogates à afficher sont ceux liés à cette entrée (+ les éléments déjà filtrés)
        @surrogates = @surrogates & Surrogate.search(params[:search])     
      # Sinon si l'utilisateur sélectionne une collection
      elsif (@col = ResourceCollection.where(:id => params[:collection_id]).first) != nil
        # Si la collection est "all" on affiche tout les surrogates
	if @col === "All"
          @surrogates = Surrogate.all
	# Sinon on affiche les surrogates de la collection (correspondant au filtrage déjà effectué)
        else
          @surrogates = @surrogates & @col.surrogates
	  # Enregistre le nom de la collection pour l'affichage
	  @colName = "Collection : #{@col.collection_name} "
        end
      end
    end # While End
  end

  # Pour l'export de tableaux
  def csv
    # TEMPORAIRE // Tout les surrogates organisés par entry_key
    @export = Surrogate.order(:entry_key)
    # TEMPORAIRE // Deux facettes au hasard pour les tests
    @facet1 = Facet.first.facet_leafs.first
    @facet2 = Facet.second.facet_leafs.first
    # Défini différents formats d'export.
    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv }
      format.xls # {send_data @export.to_csv(col_sep: "\t") }
    end
  end

  # Pour l'affichage des détails d'un surrogate
  def show
    # Sélectionne le surrogate choisi pour afficher ses détails.
    @surrogate = Surrogate.find(params[:id])
  end

  # Pour l'affichage des surrogates par tag
  def tagged
    # Si l'utilisateur sélectionne un tag
    if params[:tag].present?
      # On récupère tout les surrogates liés à ce tag
      @surrogates = Surrogate.tagged_with(params[:tag])
      # On enregistre le nom de ce tag pour l'affichage
      @tag = params[:tag]
    # Par default, la page affiche tout les surrogates (n'est pas sensé arriver)
    else
      @surrogates = Surrogate.all
      @tag = "All"
    end
  end

  # Pour la modification d'un surrogate
  def update
    # Sélectionne le surrogate choisi pour afficher ses détails.
    @surrogate = Surrogate.find(params[:id])
    # S'ils existent, on ajoute les tags entré par l'utilisateur
    @surrogate.tag_list.add(params[:surrogate][:tag_list], parse: true)
    # On sauvegarde ces tags
    @surrogate.save
    # Si l'utilisateur à sélectionné un headings de la facette ISSUE
    if !params[:issue].blank?
      # On parcours tout les headings déjà associés à ce surrogate
      @surrogate.headings.each do |h|
        # Si l'un d'entre eux est déjà inclu dans la facette ISSUE
        if h.facet_leaf_id === Heading.where(:id => params[:issue]).first.facet_leaf_id
	  # On affiche un message d'erreur
	  flash[:error] = "This resource is already in one of the ISSUE headings!"
	  return false
	end
      end
      # Sinon on lie le heading sélectionné au surrgoate.
      @surrogate.headings << Heading.where(:id => params[:issue]).first
    end
    # Si l'utilisateur à sélectionné un headings de la facette TECHNIQUE
    if !params[:technique].blank?
      # On parcours tout les headings déjà associés à ce surrogate
      @surrogate.headings.each do |h|
        # Si l'un d'entre eux est déjà inclu dans la facette TECHNIQUE
        if h.facet_leaf_id === Heading.where(:id => params[:technique]).first.facet_leaf_id
	  # On affiche un message d'erreur
	  flash[:error] = "This resource is already in one of the TECHNIQUE headings!"
	  return false
	end
      end
      # Sinon on lie le heading sélectionné au surrgoate.
      @surrogate.headings << Heading.where(:id => params[:technique]).first
    end
    # Si l'utilisateur à sélectionné un headings de la facette PROCESS
    if !params[:process].blank?
      # On parcours tout les headings déjà associés à ce surrogate
      @surrogate.headings.each do |h|
        # Si l'un d'entre eux est déjà inclu dans la facette PROCESS
        if h.facet_leaf_id === Heading.where(:id => params[:process]).first.facet_leaf_id
	  # On affiche un message d'erreur
	  flash[:error] = "This resource is already in one of the PROCESS headings!"
	  return false
	end
      end
      # Sinon on lie le heading sélectionné au surrgoate.
      @surrogate.headings << Heading.where(:id => params[:process]).first
    end
    # On rafraichi la page.
    redirect_to :back, notice: "Done!"
  end
  
  # Défini les champs de la BDD modifiables.
  def surrogate_params
    params.require(:surrogate).permit(:entry_key, :entry_type, :doi, :url, :tag_list)
  end
end
