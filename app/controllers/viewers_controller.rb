class ViewersController < ApplicationController
  def index
  end

  def create 
    if params[:code]
      redirect_to viewer_path(params[:code])
    else
      redirect_to viewers_path
    end
  end

  def show
    @view = Viewer.find_by(name_class: params[:id])
    if @view
    else
      redirect_to viewers_path
      flash[:alert] = 'Maybe your photos are not completed or invalid!'
    end
  end
end
