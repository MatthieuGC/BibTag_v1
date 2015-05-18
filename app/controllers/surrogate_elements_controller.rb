class SurrogateElementsController < ApplicationController
  def details
    @surrogateElements = SurrogateElements.all
  end
end
