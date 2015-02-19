class CommitteesDistrict < ActiveRecord::Base
  belongs_to :committee
  belongs_to :district
  
  validates :district_id, uniqueness: {scope: :committee_id}
  validates :votes, numericality: { only_integer: true, greater_than: -1}
end
