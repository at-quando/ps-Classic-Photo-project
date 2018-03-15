class ContractsController < ApplicationController
  def show
    @contract = Contract.find(params[:id])
    ids = @contract.package.split(',')
    @package = []
    ids.each do |id|
      pack = Package.find(id)
      @package.push(pack) if pack 
    end
    @ctr_photo = ContractPhotographer.where(contract_id: params[:id])
  end
end
