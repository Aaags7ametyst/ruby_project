class CommitteesVoivodshipsController < ApplicationController
  before_action :set_committees_voivodship, only: [:show, :edit, :update, :destroy]

  # GET /committees_voivodships
  # GET /committees_voivodships.json
  def index
    @committees_voivodships = CommitteesVoivodship.all
  end

  # GET /committees_voivodships/1
  # GET /committees_voivodships/1.json
  def show
  end

  # GET /committees_voivodships/new
  def new
    @committees_voivodship = CommitteesVoivodship.new
  end

  # GET /committees_voivodships/1/edit
  def edit
  end

  # POST /committees_voivodships
  # POST /committees_voivodships.json
  def create
    @committees_voivodship = CommitteesVoivodship.new(committees_voivodship_params)

    respond_to do |format|
      if @committees_voivodship.save
        format.html { redirect_to @committees_voivodship, notice: 'Committees voivodship was successfully created.' }
        format.json { render :show, status: :created, location: @committees_voivodship }
      else
        format.html { render :new }
        format.json { render json: @committees_voivodship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committees_voivodships/1
  # PATCH/PUT /committees_voivodships/1.json
  def update
    respond_to do |format|
      if @committees_voivodship.update(committees_voivodship_params)
        format.html { redirect_to @committees_voivodship, notice: 'Committees voivodship was successfully updated.' }
        format.json { render :show, status: :ok, location: @committees_voivodship }
      else
        format.html { render :edit }
        format.json { render json: @committees_voivodship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committees_voivodships/1
  # DELETE /committees_voivodships/1.json
  def destroy
    @committees_voivodship.destroy
    respond_to do |format|
      format.html { redirect_to committees_voivodships_url, notice: 'Committees voivodship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committees_voivodship
      @committees_voivodship = CommitteesVoivodship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committees_voivodship_params
      params.require(:committees_voivodship).permit(:number_of_votes)
    end
end
