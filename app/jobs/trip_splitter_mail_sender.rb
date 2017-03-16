class TripSplitterMailSender < ApplicationJob
  def perform(trip_id)
    trip = Trip.find(trip_id)
    TripCostMailer.send_email(trip).deliver_later
  end
end
