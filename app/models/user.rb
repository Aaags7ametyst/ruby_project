class User < ActiveRecord::Base
  belongs_to :district
  
  ROLES = %w[district central admin]

  acts_as_authentic do |config|
    config.validate_login_field = false
    config.validate_email_field = false
    config.validate_password_field = false
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
    config.maintain_sessions = false
  end 
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
#  validates :login, presence:  true
 # validates :crypted_password, presence:  true
 # validates :email, presence: true
  #validates :name, presence: true
  #validates :surname, presence:  true
 # validates :role, presence:  true
  
end
