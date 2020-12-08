class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @taggins = Tagging.where(tag: @tag)
    @taggins.each(&:destroy)
    @tag.destroy
    redirect_to tags_path
  end
end
