class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def index
    if current_user.admin?
      @trips = Trip.all
    else
      @trips = current_user.trips
    end
  end

  def create
    @trip = Trip.create(trip_params)
    render :new
  end

  private

  def calculate_cost_per_person
    CostPerPersonCalculator.new(self).call
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
      :user_id
      )
  end
end
