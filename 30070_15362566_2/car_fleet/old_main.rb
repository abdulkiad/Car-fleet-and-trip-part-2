class Old_main
  require_relative 'car.rb'
  require_relative 'fleet.rb'
  require_relative 'trip.rb'
  require_relative 'trip_collection.rb'
  require_relative 'trip_roster.rb'

# Reads input files, populates new Fleet and TripCollection objects,
# then creates new TripRoster object and performs trip->car assignment

# Read car data
  fleet = Fleet.new
  begin
    IO.foreach('cars.txt') do |line|
      data = line.split
      id = data[0].to_i
      litres = data[1].to_f
      km_per_l = data[2].to_f
      fleet.add_car(Car.new(id, litres, km_per_l))
    end
  end rescue abort('error reading cars.txt')

# Read trip data
  trips = TripCollection.new
  begin
    IO.foreach('trips.txt') do |line|
      data =  line.split
      id = data[0].to_i
      distance = data[1].to_f
      trips.add_trip(Trip.new(id, distance))
    end
  end rescue abort('error reading trips.txt')

# Create and output roster
  roster = TripRoster.new
  roster.create_roster(trips, fleet)
  puts roster.to_s
end