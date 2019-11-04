class Participation < ApplicationRecord

  validates :student_id, uniqueness: {scope: :course_id}

  belongs_to :student
  belongs_to :course
  has_many :help_requests

end
