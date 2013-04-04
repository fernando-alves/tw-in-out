class WorkdaysController < ApplicationController
  before_filter :authenticate_user!

  def index
    @workdays = Workday.order(:day).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workdays }
    end
  end

  def show
    @workday = Workday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workday }
    end
  end

  def new
    @workday = Workday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workday }
    end
  end

  def edit
    @workday = Workday.find(params[:id])
  end

  def create
    @workday = Workday.find_or_create_by_day(params[:workday][:day])

    respond_to do |format|
      if @workday.valid?
        format.html { redirect_to @workday, notice: 'Workday was successfully created.' }
        format.json { render json: @workday, status: :created, location: @workday }
      else
        format.html { render action: "new" }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @workday = Workday.find(params[:id])

    respond_to do |format|
      if @workday.update_attributes(params[:workday])
        format.html { redirect_to @workday, notice: 'Workday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @workday = Workday.find(params[:id])
    @workday.destroy

    respond_to do |format|
      format.html { redirect_to workdays_url }
      format.json { head :no_content }
    end
  end
end
