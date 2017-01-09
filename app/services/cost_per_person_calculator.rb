class CostPerPersonCalculator
  def initialize(trip)
    @trip = trip
  end

  def call
    @trip.cost_per_person = calculate_cost
  end

  private

  def calculate_cost
    return 0 if !@trip.driver_included && @trip.people_count == 1
    if @trip.tanking_cost.nil?
      trip_details_calc
    else
      fuel_invoice_calc
    end
  end

  def fuel_invoice_calc
    if !@trip.driver_included?
      @trip.tanking_cost / (@trip.people_count - 1)
    else
      @trip.tanking_cost / @trip.people_count
    end
  end

  def trip_details_calc
    final_headcount = @trip.driver_included? ? @trip.people_count : (@trip.people_count - 1)
    (@trip.trip_distance * (@trip.avg_consumption / 100) * @trip.fuel_cost) / final_headcount
  end
end
