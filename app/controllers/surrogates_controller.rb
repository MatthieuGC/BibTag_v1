class SurrogatesController < ApplicationController
  def index
    @surrogates = Surrogate.all
  end

  def show
    @surrogate = Surrogate.find(params[:id])
  end

  def tagged
    if params[:tag].present?
      @surrogate = Surrogate.tagged_with(params[:tag])
    else
      @surrogate = Surrogate.all
    end
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
