class HomeController < ApplicationController
  def index
    @images = Photo.all
    @videos = Video.all
    @message = Message.new
    @photographers = Photographer.where(favorite: true).limit(3)
  end

  def create
    
  end
end
