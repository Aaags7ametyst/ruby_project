class Committee < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :logo, format: {with:/\Ahttp(s)?:/, allow_blank:true}
  
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :voivodships
end
