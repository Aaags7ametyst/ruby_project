class AddRelationsToDistricts < ActiveRecord::Migration
  def change
    add_reference :districts, :voivodship, index: true
  end
end
