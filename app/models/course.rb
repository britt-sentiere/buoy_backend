class Course < ApplicationRecord
  belongs_to :teacher
  has_many :participations
  has_many :students, through: :participations
  has_many :help_requests, through: :participations
end

