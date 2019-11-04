class Student < User


  has_many :participations
  has_many :courses, through: :participations
  has_many :help_requests, through: :participations
  has_many :teachers, through: :courses

  def number_of_hand_raises
   
    beginning_of_day =  Time.now.beginning_of_day.strftime 
    end_of_day = Time.now.end_of_day.strftime 
    help_requests.where("created_at >= ? AND created_at <= ?", beginning_of_day, end_of_day).count
  end

  def open_help_request
    help_requests[0] || help_requests.order(created_at: :desc).find_by(completed_time: nil).created_at
  end

  def formatted_help_request
    last_request = open_help_request 
    last_request || last_request.strftime("%b %e, %l:%M %p")
  end
end

