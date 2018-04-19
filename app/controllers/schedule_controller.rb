class ScheduleController < ApplicationController
  def index
    @contracts = Contract.all.order(taken_date: :desc).group_by(&:taken_date)
    @contracts_bonus = Contract.all.order(taken_date_2: :desc).group_by(&:taken_date_2)
  end
end
