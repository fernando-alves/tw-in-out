class LunchTimesController < ApplicationController
  def create
    workday = Workday.find(params[:workday][:id])
    lunch_time = Punch::LunchTime.new(current_user, workday)
    lunch_time.save

    redirect_to workday
  end
end
