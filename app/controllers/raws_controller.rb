class RawsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def create
    if params[:code]
      redirect_to raw_path(params[:code])
    else
      redirect_to viewers_path
    end
  end

  def show
    res = Cloudinary::Api.resources(:type => :upload, :max_results => 500, :prefix => params[:id])
    images = res["resources"]
    while res.has_key?("next_cursor") do
      res = Cloudinary::Api.resources(:type => :upload, :max_results => 500, :prefix => params[:id], :next_cursor => res["next_cursor"])
      images= images + res["resources"]
    end
    if images.length > 0
      @images = JSON.parse(images.to_json, object_class: OpenStruct)
      @code= params[:id]
    else
      redirect_to viewers_path
    end
  end

  def submit
    if @contract = Contract.find_by(code: params[:id])
      if @contract.update_attributes(raw: params[:value])
        redirect_to raws_path
      else
        redirect_to raw_path(params[:id])
      end
    end
  end
end
