require_relative 'trip.rb'

# TripCollection stores an array of trip objects. 

class TripCollection

  attr_reader :trips
  
  def initialize(trips = nil)
    @trips = trips.equal?(nil) ? [] : trips
  end

  def add_trip(trip)
    @trips.push(trip)
  end

  def sort_by_distance_ascending
    trips = @trips.sort{|t1, t2| t1.distance <=> t2.distance}
    TripCollection.new(trips)
  end
  def sort_by_distance_descending
    trips = @trips.sort{|t1, t2| t2.distance <=> t1.distance}
    TripCollection.new(trips)
  end


end