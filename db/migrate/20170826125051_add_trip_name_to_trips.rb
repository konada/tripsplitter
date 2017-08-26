class AddTripNameToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :trip_name, :string
  end
end
