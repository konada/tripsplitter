class TripsController < ApplicationController
  def new
    @trip = Trip.new
  end

  def create
    Trip.create(params[:trip])
  end

  def show
    @trip = Trip.find(params[:id])
  end
end
