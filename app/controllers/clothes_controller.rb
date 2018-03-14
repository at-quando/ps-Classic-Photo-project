class ClothesController < ApplicationController
  def index
    @articles = Article.where(kind: 0)
  end

  def show
    @article = Article.find(params[:id])
  end
end
