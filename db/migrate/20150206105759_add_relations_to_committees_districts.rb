class AddRelationsToCommitteesDistricts < ActiveRecord::Migration
  def change
    add_reference :committees_districts, :district, index: true
    add_reference :committees_districts, :committee, index: true
  end
end
