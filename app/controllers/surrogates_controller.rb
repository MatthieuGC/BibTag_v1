class SurrogatesController < ApplicationController
  def index
    @facets = Facet.all
    @i = 1
    @path = ""
    @colName = ""
    @surrogates = Surrogate.all
    while @i <= Heading.count
      if params[":heading"+"#{@i}"]
        @path = @path+"> #{params[":heading"+"#{@i}"]} "
        @surrogates = @surrogates & Surrogate.joins(:headings).where("headings.heading_name = '#{params[":heading"+"#{@i}"]}'")
      end
      @i = @i + 1

      if params[:search]
        @surrogates = @surrogates & Surrogate.search(params[:search])
      elsif (@col = ResourceCollection.where(:id => params[:collection_id]).first) != nil
        if @col === "All"
          @surrogates = Surrogate.all
        else
          @surrogates = @surrogates & @col.surrogates
	  @colName = "Collection : #{@col.collection_name} "
        end
      end

    end
  end

  def csv
    @export = Surrogate.order(:entry_key)
    respond_to do |format|
      format.html
      format.csv { send_data @export.to_csv }
      format.xls # {send_data @export.to_csv(col_sep: "\t") }
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
