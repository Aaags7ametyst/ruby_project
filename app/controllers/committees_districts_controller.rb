class CommitteesDistrictsController < ApplicationController
  before_action :set_committees_district, only: [:show, :edit, :update, :destroy]

  # GET /committees_districts
  # GET /committees_districts.json


  def index
   # @committees_districts = CommitteesDistrict.all
  #end
    @user = current_user
    @committees = CommitteesDistrict.all.where("committees_districts.district_id = ?", 1)
   # committees.each do |committee|
	#puts "#{committee.district.name} #{committee.voivodship.name} #{committee.name} #{committee.votes}"
    #end
  end	

  # GET /committees_districts/1
  # GET /committees_districts/1.json
  def show
  end

  # GET /committees_districts/new
  def new
    @committees_district = CommitteesDistrict.new
  end

  # GET /committees_districts/1/edit
  def edit
  end

  # POST /committees_districts
  # POST /committees_districts.json
  def create
    @committees_district = CommitteesDistrict.new(committees_district_params)

    respond_to do |format|
      if @committees_district.save
        format.html { redirect_to @committees_district, notice: 'Committees district was successfully created.' }
        format.json { render :show, status: :created, location: @committees_district }
      else
        format.html { render :new }
        format.json { render json: @committees_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committees_districts/1
  # PATCH/PUT /committees_districts/1.json
  def update
    respond_to do |format|
      if @committees_district.update(committees_district_params)
        format.html { redirect_to @committees_district, notice: 'Committees district was successfully updated.' }
        format.json { render :show, status: :ok, location: @committees_district }
      else
        format.html { render :edit }
        format.json { render json: @committees_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committees_districts/1
  # DELETE /committees_districts/1.json
  def destroy
    @committees_district.destroy
    respond_to do |format|
      format.html { redirect_to committees_districts_url, notice: 'Committees district was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committees_district
      @committees_district = CommitteesDistrict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committees_district_params
      params.require(:committees_district).permit(:votes)
    end
end
