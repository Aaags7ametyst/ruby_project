class CommitteesDistrict < ActiveRecord::Base
  belongs_to :committee
  belongs_to :district
  
  validates :district_id, uniqueness: {scope: :committee_id}
end
