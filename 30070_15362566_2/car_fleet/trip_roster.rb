require_relative 'fleet.rb'
require_relative 'trip_collection.rb'
# TripRoster stores trip<->car mapping

class TripRoster

  attr_reader :roster

  def initialize
    @roster = Hash.new
  end

  def add_to_roster(trip, car)
    @roster.store(trip, car)
  end


  def create_roster(trips, fleet)
    sorted_fleet = fleet.sort_by_range_ascending
    sorted_trips = trips.sort_by_distance_ascending
    sorted_trips.trips.zip(sorted_fleet.cars).each do |trip, car|
      if trip.distance <= car.range_in_km
        @roster[trip] = car
      else
        abort('No solution possible')
      end
    end
  end

  def create_roster2(trips, fleet)
    sorted_fleet = fleet.sort_by_most_economic
    sorted_trips = trips.sort_by_distance_descending

    sorted_trips.trips.each do |trip|
      car_trip=false
      sorted_fleet.cars.each do |car|

      if (trip.distance <= car.range_in_km)  && (car.num_available_seats >= trip.people) &&(!car.assigned_car) && !car_trip
        @roster[trip] = car
      car.assign_car_trip
      car_trip=true
      end
    end
      end
    end

  def to_s
    str = ''
    @roster.each do |trip, car|
      if car!=nil then
     if   car.specific_car
            str += "Trip #{trip.id.to_s} for #{trip.people} people is undertaken by #{car.id.to_s} (#{car.car_type_s}) with range #{car.range_in_km} kilometre\n"
     end

      end
     if !car.specific_car
      str += "Trip #{trip.id.to_s} is undertaken by Car #{car.id.to_s}\n"
             end


    end
    return str
  end

end