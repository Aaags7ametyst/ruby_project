class CommitteesVoivodship < ActiveRecord::Base
  belongs_to :committee
  belongs_to :voivodship

  validates :voivodship_id, uniqueness: {scope: :committee_id}
end
