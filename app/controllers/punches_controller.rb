class PunchesController < ApplicationController

  def index
    @punches = Punch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @punches }
    end
  end

  def show
    @punch = Punch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @punch }
    end
  end

  def new
    @punch = Punch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @punch }
    end
  end

  # GET /punches/1/edit
  def edit
    @punch = Punch.find(params[:id])
  end

  # POST /punches
  # POST /punches.json
  def create
    @punch = Punch.new(params[:punch])

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

  # PUT /punches/1
  # PUT /punches/1.json
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

  # DELETE /punches/1
  # DELETE /punches/1.json
  def destroy
    @punch = Punch.find(params[:id])
    @punch.destroy

    respond_to do |format|
      format.html { redirect_to punches_url }
      format.json { head :no_content }
    end
  end
end
