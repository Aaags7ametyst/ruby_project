class AddRelationsToCommitteesVoivodships < ActiveRecord::Migration
  def change
    add_reference :committees_voivodships, :voivodship, index: true
    add_reference :committees_voivodships, :committee, index: true
  end
end
