class CreateCommitteesDistricts < ActiveRecord::Migration
  def change
    create_table :committees_districts do |t|
      t.integer :votes

      t.timestamps
    end
  end
end
