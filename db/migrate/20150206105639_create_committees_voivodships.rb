class CreateCommitteesVoivodships < ActiveRecord::Migration
  def change
    create_table :committees_voivodships do |t|
      t.integer :number_of_votes

      t.timestamps
    end
  end
end
