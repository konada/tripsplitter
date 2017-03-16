FactoryGirl.define do
  factory :trip do
    people_count 1
    driver_included true
    trip_distance 100
    fuel_cost 10
    avg_consumption 4
    tanking_cost 100
    email 'test@test.com'
  end
end

