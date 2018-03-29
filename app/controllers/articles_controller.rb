class ArticlesController < ApplicationController
  require 'net/http'
  
  def index
    if request.path == '/posing'
      @articles = Article.all.where(kind: 1)
      @article = Article.find_by(kind: 1, favorite: 1)
      @articles_rand= Article.order("RAND()")
    elsif request.path == '/clothes'
      @articles = Article.all.where(kind: 0)
      @article = Article.find_by(kind: 0, favorite: 1)
      @articles_rand= Article.order("RAND()")
    elsif request.path == '/ask'
      @articles = Article.all.where(kind: 3)
      @article = Article.find_by(kind: 3, favorite: 1)
      @articles_rand= Article.order("RAND()")
    elsif request.path == '/concept'
      @articles = Article.all.where(kind: 2)
      @article = Article.find_by(kind: 2, favorite: 1)
      @articles_rand= Article.order("RAND()")
    else 
      @articles = Article.all
    end
  end
end
