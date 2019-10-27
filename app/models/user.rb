class User < ApplicationRecord
  
  has_secure_password
  validates: :first_name, presence: true, uniqueness: true
  validates: :last_name, presence: true, uniqueness: true

  belongs_to :student
  belongs_to :teacher

  has_many :help_requests
  has_many :participations
  has_many :courses
end
