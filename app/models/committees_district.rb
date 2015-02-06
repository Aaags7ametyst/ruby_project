class CommitteesDistrict < ActiveRecord::Base
  belongs_to :committee
  belongs_to :district
end
