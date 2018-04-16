class ScheduleController < ApplicationController
  def index
    @contracts = Contract.all.group_by(&:taken_date)
  end
end
