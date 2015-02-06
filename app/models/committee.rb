class Committee < ActiveRecord::Base
  validates :name, presence: true

  has_and_belongs_to_many :districts
  has_and_belongs_to_many :voivodships
end
