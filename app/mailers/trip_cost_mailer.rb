class TripCostMailer < ApplicationMailer
  default from: 'trip@tripsplitt.er'

  def send_email(trip)
    @trip = trip
    mail(to: @trip.email, subject: I18n.t('.subject'))
  end
end
