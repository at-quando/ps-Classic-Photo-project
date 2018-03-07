class PricesController < ApplicationController
  def index
    @money = 1234
    @basic_package = Price.all.map{|x| [x.num_pp,[x.price,x.num_pg]]}
    @extend_price = {:item1 => 1}
    Package.all.each do |package|
      key = package.key
      @extend_price[key] = {
        name: package.name,
        price: package.price
      }
    end
  end
end
