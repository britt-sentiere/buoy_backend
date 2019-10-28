class Course < ApplicationRecord
  belongs_to :teacher # may need to specify class name of User
  has_many :participations
  has_many :students, through: :participations
  has_many :help_requests, through: :participations
end

