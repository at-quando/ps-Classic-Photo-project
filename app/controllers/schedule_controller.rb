class ScheduleController < ApplicationController
  def index
    @contracts = Contract.all.order(taken_date: :desc).group_by(&:taken_date)
  end
end
