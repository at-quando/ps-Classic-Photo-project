class ViewersController < ApplicationController
  def index
    # @image = Cloudinary::Api.resources(:type => :upload, :prefix => "50mmstudio")
  end

  def create 
    if params[:code]
      redirect_to viewer_path(params[:code])
    else
      redirect_to viewers_path
    end
  end

  def show
    @view = Contract.find_by(code: params[:id].downcase)
    if params[:page]
      @page = params[:page]
    else 
      @page = 1
    end
    if @view
      @link = @view.viewers[0].drive_link.split(',')
    else
      redirect_to viewers_path
      flash[:alert] = 'Maybe your photos are not completed or invalid!'
    end
  end
end
