class SurrogatesController < ApplicationController
  def index
    if params[:search]
      @surrogates = Surrogate.search(params[:search])
    elsif (@col = ResourceCollection.where(:id => params[:collection_id]).first) != nil
      if @col === "All"
        @surrogates = Surrogate.all
      else
        @surrogates = @col.surrogates
      end
    else
      @surrogates = Surrogate.all
    end
  end

  def show
    @surrogate = Surrogate.find(params[:id])
  end

  def tagged
    if params[:tag].present?
      @surrogates = Surrogate.tagged_with(params[:tag])
      @tag = params[:tag]
    else
      @tag = Surrogate.all
    end
  end
  
  def about
    @titre = "About"
  end

  def contact
    @titre = "Contact"
  end

  def update
    @surrogate = Surrogate.find(params[:id])
    @surrogate.tag_list.add(params[:surrogate][:tag_list], parse: true)
    @surrogate.save
    
    if !params[:issue].blank?
      @surrogate.headings.each do |h|
        if h.facet_leaf_id === Heading.where(:id => params[:issue]).first.facet_leaf_id
	  flash[:error] = "This resource is already in one of the ISSUE headings!"
	  return false
	end
      end
      @surrogate.headings << Heading.where(:id => params[:issue]).first
    end
    if !params[:technique].blank?
      @surrogate.headings.each do |h|
        if h.facet_leaf_id === Heading.where(:id => params[:technique]).first.facet_leaf_id
	  flash[:error] = "This resource is already in one of the TECHNIQUE headings!"
	  return false
	end
      end
      @surrogate.headings << Heading.where(:id => params[:technique]).first
    end
    if !params[:process].blank?
      @surrogate.headings.each do |h|
        if h.facet_leaf_id === Heading.where(:id => params[:process]).first.facet_leaf_id
	  flash[:error] = "This resource is already in one of the PROCESS headings!"
	  return false
	end
      end
      @surrogate.headings << Heading.where(:id => params[:process]).first
    end
    redirect_to :back, notice: "Done!"
  end

  def surrogate_params
    params.require(:surrogate).permit(:entry_key, :entry_type, :doi, :url, :tag_list)
  end
end
