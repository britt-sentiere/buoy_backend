class Course < ApplicationRecord


  belongs_to :teacher
  has_many :participations
  has_many :students, through: :participations
  has_many :help_requests, through: :participations, source: :help_requests

  def participations_ordered_by_help_requests
    beginning_of_day =  Time.now.beginning_of_day
    end_of_day = Time.now.end_of_day

    participations_for_today = participations.joins(:help_requests).where("help_requests.created_at >= ? AND help_requests.created_at <= ?", beginning_of_day, end_of_day)

    if participations_for_today.any?
      participations_for_today.select { |participation| participation.student.open_help_request }.sort_by { |participation| participation.student.open_help_request.created_at }
    else
      []
    end
  end
end

