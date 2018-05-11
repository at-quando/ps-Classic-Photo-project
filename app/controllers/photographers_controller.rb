class PhotographersController < ApplicationController
  def index
    @photographers = Photographer.all
  end

  def show
    @photographer = Photographer.find(params[:id])
    uri   = URI.parse(request.fullpath)
    @status = ''
    @check = false
    if uri.query
      params = CGI.parse(uri.query)
      @status  = params['status'].first
      if @status == "unpaid"
        @shows = @photographer.contract_photographers.where(paid: false)
      else
        @shows = @photographer.contract_photographers
      end
      token  = params['token'].first
      if AdminSecret.find_by(token_secret: token)
        @check = true
      end
    else
      @shows = @photographer.contract_photographers
    end
  end

  def update
    @photographer = ContractPhotographer.find(params[:id])
    if !@photographer.paid
      @photographer.update_attributes(paid: true)
    end
    redirect_to photographer_path(@photographer.photographer_id)
  end

  def payall
    @contract_pay = Photographer.find(params[:id]).contract_photographers
    @contract_pay.each do |pay|
      if !pay.paid
        pay.update_attributes(paid: true)
      end
    end
    redirect_to photographer_path(params[:id])
  end
end
