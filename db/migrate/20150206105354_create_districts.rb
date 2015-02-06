class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :eligible_voters
      t.integer :valid_votes
      t.integer :invalid_votes
      t.integer :vote_cards

      t.timestamps
    end
  end
end
