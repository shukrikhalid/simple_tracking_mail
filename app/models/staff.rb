class Staff < ApplicationRecord
  belongs_to :position
  belongs_to :department


  has_secure_password
    
  validates_uniqueness_of :email
end
