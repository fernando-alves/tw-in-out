class PunchesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :json

  def index
    redirect_to controller: "workdays", action: "index"
  end

  def show
    @punch = Punch.find(params[:id])
  end

  def new
    @punch = Punch.next_by current_user
  end

  def edit
    @punch = Punch.find(params[:id])
  end

  def create
    @punch = Punch::Register.punch(current_user, params[:punch])
    respond_to do |format|
      if @punch.save
        format.html { redirect_to @punch, notice: 'Punch was successfully created.' }
        format.json { render json: @punch, status: :created, location: @punch }
      else
        format.html { render action: "new" }
        format.json { render json: @punch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @punch = Punch.find(params[:id])

    respond_to do |format|
      if @punch.update_attributes(params[:punch])
        format.html { redirect_to @punch, notice: 'Punch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @punch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @punch = Punch.find(params[:id])
    @punch.destroy
    respond_to do |format|
      format.html { redirect_to punches_url }
      format.json { head :no_content }
    end
  end
end
