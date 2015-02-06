class CommitteesVoivodship < ActiveRecord::Base
  belongs_to :committee
  belongs_to :voivodship
end
