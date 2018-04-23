require_relative 'car.rb'
require_relative 'fleet.rb'
require_relative 'trip.rb'
require_relative 'trip_collection.rb'
require_relative 'trip_roster.rb'
require_relative 'electrical_car'
require_relative 'petrol_car'
require_relative 'diesel_car'
# Reads input files, populates new Fleet and TripCollection objects,
# then creates new TripRoster object and performs trip->car assignment

# Read car data
fleet = Fleet.new
begin
  IO.foreach('cars2.txt') do |line|
    data = line.split
    fuel_type= data[0].to_s
    id = data[1].to_i
    litres = data[2].to_f
    km_per_l = data[3].to_f
    #puts fuel_type
    if fuel_type=='D'
      fleet.add_car(Diesel_car.new(id, litres, km_per_l))
    end
    if fuel_type == 'E'
      fleet.add_car(Electrical_car.new(id, litres, km_per_l))
    end
  if  fuel_type == 'P'
      fleet.add_car(Petrol_car.new(id, litres, km_per_l))

  end


  end
end rescue abort('error reading cars2.txt')

# Read trip data
trips = TripCollection.new
begin
  IO.foreach('trips2.txt') do |line|
    data =  line.split
    id = data[0].to_i
    distance = data[1].to_f
    passengers= data[2].to_i
    trip_entry=Trip.new(id, distance)
    trip_entry.add_pass(passengers)
    trips.add_trip(trip_entry)


  end
end rescue abort('error reading trips2.txt')

# Create and output roster
roster = TripRoster.new
roster.create_roster2(trips, fleet)
puts roster.to_s
