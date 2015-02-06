class District < ActiveRecord::Base
 has_and_belongs_to_many :committees
 has_many :users
 belongs_to :voivodship
end
