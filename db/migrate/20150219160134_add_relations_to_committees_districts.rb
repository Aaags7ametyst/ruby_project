class AddRelationsToCommitteesDistricts < ActiveRecord::Migration
  def change
    add_reference :committees_districts, :voivodship, index: true
  end
end
