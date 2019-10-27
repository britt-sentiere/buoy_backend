class Course < ApplicationRecord
  belongs_to :teacher
  has_many :students
  has_many :participations
  has_many :help_requests
end

