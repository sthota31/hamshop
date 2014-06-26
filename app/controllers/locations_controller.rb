class LocationsController < ApplicationController
  before_filter :require_authantication
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  layout "admin"
 

  def index
    @locations = Location.all
  end

  
  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  
  def create
    params.permit!
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_url, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      params.permit!
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params[:location]
    end
end
