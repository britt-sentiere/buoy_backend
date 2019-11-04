class Course < ApplicationRecord


  belongs_to :teacher
  has_many :participations
  has_many :students, through: :participations
  has_many :help_requests, through: :participations

  def participations_ordered_by_help_requests
    participations.select { |participation| participation.student.open_help_request }.sort_by { |participation| participation.student.open_help_request.created_at }
  end
end

