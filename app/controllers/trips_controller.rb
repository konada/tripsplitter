class TripsController < ApplicationController
  expose :trip
  expose :trips  { get_trips }

  def new
    trip = Trip.new
    trip.invoice = params[:file]
  end

  def create
    trip.save
    render :new
  end

  private

  def calculate_cost_per_person
    CostPerPersonCalculator.new(self).call
  end

  def get_trips
    if current_user.admin?
      collection = Trip.all
    else
      collection = current_user.trips
    end
  end

  def trip_params
    params.require(:trip).permit(
      :people_count,
      :driver_included,
      :trip_distance,
      :fuel_cost,
      :avg_consumption,
      :tanking_cost,
      :email,
      :trip_name,
      :user_id,
      :invoice
      )
  end
end
