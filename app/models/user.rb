class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true, uniqueness: true
  validates :last_name, presence: true, uniqueness: true
  validates :email, uniqueness: true 
end
