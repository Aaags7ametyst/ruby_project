class CommitteesDistrict < ActiveRecord::Base
  belongs_to :committee
  belongs_to :district
  belongs_to :voivodship
 
  validate :nowsze
  validate :nowe
  def nowsze
	@cards = District.all.where("id = ?", self.district_id)
	@alls = CommitteesDistrict.all.where("district_id = ?", self.district_id).where("committee_id != ?", self.committee_id).group("district_id").sum("votes")

	@alls.each do |all|
	@cards.each do |card|

		if self.votes != nil
			if self.votes > card.valid_votes - all[1]
	  		errors.add(:base, 'Sum of votes is higher than number of valid votes')
			end
		end
	end
   end
 end
  def nowe
	@cards = District.all.where("id = ?", self.district_id)
	@cards.each do |card|
	if self.votes != nil
	  if self.votes > card.vote_cards
	    errors.add(:base, 'Number of votes is to high (more votes than vote cards)')
	  end
	end
	end
  end

  validates :district_id, uniqueness: {scope: :committee_id}
 
  validates :votes, numericality: { only_integer: true, greater_than: -1, allow_blank: true}
 
end
