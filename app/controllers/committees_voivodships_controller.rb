class CommitteesVoivodshipsController < ApplicationController
  before_action :set_committees_voivodship, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /committees_voivodships
  # GET /committees_voivodships.json
  def index
    @committees_voivodships = CommitteesVoivodship.all
  end

  def full
	@voivodship_votes = CommitteesVoivodship.select(:committee_id, :voivodship_id)
	@committees_voivodships = CommitteesDistrict.joins(:district => :voivodship).joins(:committee).all.order("voivodships.name")
	@sums = @committees_voivodships.group("committees.name", "voivodships.name").sum("votes")
  end
  
  def results
	@committees_voivodships = CommitteesDistrict.joins(:district => :voivodship).joins(:committee).all.where("valid_votes is not null").select("districts.voivodship_id, committee_id, SUM(valid_votes) AS karty, SUM(votes) AS votes").group("committees.name", "voivodships.name").order("voivodships.name")
	#@sums = @committees_voivodships.group("committees.name", "voivodships.name").sum("votes")
	#@valid = @committees_voivodships.group("committees.name", "voivodships.name").sum("valid_votes")
  end

  def percentage
	@votes = District.joins(:voivodship).where("vote_cards is not null").all.order("name")	
  end

  def turnout
	#@voters = District.joins(:voivodship).all.where("vote_cards is not null").group("voivodship_id").sum("eligible_voters AND vote_cards")
		@voters = District.joins(:voivodship).all.where("vote_cards is not null").select("voivodship_id, SUM(eligible_voters) AS glosy, SUM(vote_cards) AS karty").group("voivodship_id").order("voivodships.name")
																		
	#@eligible_sums = @voters.group("voivodship_id").sum("eligible_voters")
  	#@vote_sums = @voters.group("voivodship_id").sum("vote_cards")
	@voivodships = Voivodship.all
  end

  def invalid
	@votes = District.joins(:voivodship).all.where("vote_cards is not null").select("voivodship_id, SUM(invalid_votes) AS glosy, SUM(puste) AS puste, SUM(wiele) AS wiele, SUM(inne)AS inne").group("voivodship_id").order("voivodships.name")
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
