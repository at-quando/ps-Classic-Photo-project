class PricesController < ApplicationController
  def index
    @money = 1234
    @extend_price = {
      "night": {
        "name": "Night shooting",
        "price": 1000
      },
      "cfs": {
        "name": "Confession Video",
        "price": 2000
      },
      "hl": {
        "name": "Highlight Video",
        "price": 3000
      },
      "story": {
        "name": "Story Video",
        "price": 4000
      }
    }
  end
end
