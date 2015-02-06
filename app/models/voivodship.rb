class Voivodship < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :places, presence: true

  has_and_belongs_to_many :committees
  has_many :districts
end
