class StudentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "students_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
