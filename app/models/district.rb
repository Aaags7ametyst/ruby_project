class District < ActiveRecord::Base
 has_and_belongs_to_many :committees
 has_many :users
 belongs_to :voivodship
 has_many :committees_districts
 
 if @current_user
 validate :sum_equals
 validate :sum_votes
 
 def sum_equals
	if self.invalid_votes != self.puste + self.wiele + self.inne
		errors.add(:base, 'invalid sum of invalid votes')
	end
 end

 def sum_votes
	if self.vote_cards != self.invalid_votes + self.valid_votes
		errors.add(:base, 'number of vote cards is not equal to sum of valid and invalid votes')
	end
 end

 validates :name, presence: true, uniqueness: true

 validates :eligible_voters, numericality: { only_integer: true, greater_than: 0 }
 validates :invalid_votes, numericality: { only_integer: true, greater_than: -1}
  end
end
