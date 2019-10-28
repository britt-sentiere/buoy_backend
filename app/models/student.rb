class Student < User
  has_many :participations
  has_many :courses, through: :participations
  has_many :help_requests, through: :participations
  has_many :teachers, through: :courses
end