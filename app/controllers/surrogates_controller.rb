class SurrogatesController < ApplicationController
  def index
    @surrogates = Surrogate.all
  end

  def show
    @surrogate = Surrogate.find(params[:id])
  end
end
