class User < ActiveRecord::Base
  validates :login, presence:  true
  validates :crypted_password, presence:  true
  validates :email, presence: true
  validates :name, presence: true
  validates :surname, presence:  true
  validates :role, presence:  true

  belongs_to :district
end
