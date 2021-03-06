class FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:show, :edit, :update, :destroy]

  # GET /floorplans
  # GET /floorplans.json
  def index
    @floorplans = Floorplan.all
  end

  # GET /floorplans/1
  # GET /floorplans/1.json
  def show
  end

  # GET /floorplans/new
  def new
    @floorplan = Floorplan.new
  end

  # GET /floorplans/1/edit
  def edit
    @floorplan = Floorplan.find(params[:id])
    room = @floorplan.rooms.build
  end

  # POST /floorplans
  # POST /floorplans.json
  def create
    @listing = Listing.find(params[:listing_id])
    @floorplan = @listing.floorplans.create(floorplan_params)
    redirect_to floorplan_path(@floorplan)


    respond_to do |format|
      if @floorplan.save
        format.html { redirect_to @floorplan, notice: 'Floorplan was successfully created.' }
        format.json { render :show, status: :created, location: @floorplan }
      else
        format.html { render :new }
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floorplans/1
  # PATCH/PUT /floorplans/1.json
  def update
    @listing = Listing.find(params[:listing_id])
    respond_to do |format|
      if @floorplan.update(floorplan_params)
        format.html { redirect_to @listing, notice: 'Floorplan was successfully updated.' }
        format.json { render :show, status: :ok, location: @floorplan }
      else
        format.html { render :edit }
        format.json { render json: @floorplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floorplans/1
  # DELETE /floorplans/1.json
  def destroy
    @floorplan.photo = nil
    @floorplan.save
    @floorplan.destroy
    respond_to do |format|
      format.html { redirect_to floorplans_url, notice: 'Floorplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floorplan
      @floorplan = Floorplan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def floorplan_params
      params.require(:floorplan).permit(:title, :description, :num_bed, :num_bath, :photo, rooms_attributes: [:title, :photo_one, :photo_two, :photo_three, :photo_four, :is_bed, :is_bath, :_destroy])
    end
end
