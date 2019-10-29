class Student < User
  has_many :participations
  has_many :courses, through: :participations
  has_many :help_requests, through: :participations
  has_many :teachers, through: :courses

  def number_of_hand_raises
    # date = Date.today

    # date.to_time.in_time_zone('America/Chicago').beginning_of_day

    beginning_of_day =  Time.now # find a datetime object
    end_of_day = Time.now # find a datetime object
    help_requests.where("created_at <= ? AND created_at >= ?", beginning_of_day, end_of_day).count
  end
end