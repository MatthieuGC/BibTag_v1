class TagsController < ApplicationController
  def show
    @tag = Tag.all
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to surrogates_path, notice: "The resource has been tagged."
  end

  def edit
  end

  private def tag_params
    params.require(:tag).permit(:tag_name)
  end
end
