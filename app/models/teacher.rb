class Teacher < User
  has_many :courses
  has_many :participations, through: :courses
  has_many :students, through: :participations, source: :student
  has_many :help_requests, through: :participations
end