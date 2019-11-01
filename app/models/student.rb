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
end
