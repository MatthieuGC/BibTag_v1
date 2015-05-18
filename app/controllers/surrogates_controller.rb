class SurrogatesController < ApplicationController
  def index
    @surrogates = Surrogate.all
  end
end
