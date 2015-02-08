class AddReasonToDistrict < ActiveRecord::Migration
  def change
    add_column :districts, :puste, :integer
    add_column :districts, :wiele, :integer
    add_column :districts, :inne, :integer
  end
end
