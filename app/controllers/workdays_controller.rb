class WorkdaysController < ApplicationController
  # GET /workdays
  # GET /workdays.json
  def index
    @workdays = Workday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workdays }
    end
  end

  # GET /workdays/1
  # GET /workdays/1.json
  def show
    @workday = Workday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workday }
    end
  end

  # GET /workdays/new
  # GET /workdays/new.json
  def new
    @workday = Workday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workday }
    end
  end

  # GET /workdays/1/edit
  def edit
    @workday = Workday.find(params[:id])
  end

  # POST /workdays
  # POST /workdays.json
  def create
    @workday = Workday.new(params[:workday])

    respond_to do |format|
      if @workday.save
        format.html { redirect_to @workday, notice: 'Workday was successfully created.' }
        format.json { render json: @workday, status: :created, location: @workday }
      else
        format.html { render action: "new" }
        format.json { render json: @workday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workdays/1
  # PUT /workdays/1.json
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

  # DELETE /workdays/1
  # DELETE /workdays/1.json
  def destroy
    @workday = Workday.find(params[:id])
    @workday.destroy

    respond_to do |format|
      format.html { redirect_to workdays_url }
      format.json { head :no_content }
    end
  end
end
