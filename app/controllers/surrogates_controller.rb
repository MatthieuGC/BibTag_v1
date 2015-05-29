class SurrogatesController < ApplicationController
  def index
    @surrogates = Surrogate.all
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
    redirect_to(:back)
  end

  def surrogate_params
    params.require(:surrogate).permit(:entry_key, :entry_type, :doi, :url, :tag_list)
  end
end
