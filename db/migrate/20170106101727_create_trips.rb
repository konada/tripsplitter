class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :people_count, default: 1, null: false
      t.boolean :driver_included, default: true, null: false
      t.integer :trip_distance
      t.decimal :fuel_cost
      t.decimal :avg_consumption
      t.decimal :tanking_cost
      t.decimal :cost_per_person, scale: 2

      t.timestamps
    end
  end
end
