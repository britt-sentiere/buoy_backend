class HelpRequestsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "help_requests_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
