class PunchesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    redirect_to controller: 'workdays', action: 'index'
  end

  def show
    @punch = Punch.find(params[:id])
  end

  def new
    @punch = Punch.new
  end

  def edit
    @punch = Punch.find(params[:id])
  end

  def create
    @punch = Punch::Register.punch(current_user, params[:punch])
    if @punch.save
      redirect_to @punch, notice: 'Punch was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @punch = Punch.find(params[:id])
    if @punch.update_attributes(params[:punch])
      redirect_to @punch, notice: 'Punch was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @punch = Punch.find(params[:id])
    workday = @punch.workday

    @punch.destroy

    redirect_to workday
  end
end
