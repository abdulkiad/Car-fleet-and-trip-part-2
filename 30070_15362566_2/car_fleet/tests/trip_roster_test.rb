require 'test/unit'
require_relative '../trip_roster.rb'

class TripRosterTest < Test::Unit::TestCase
  def setup
    @roster = TripRoster.new

  end

  def test_create_roster
    trips = TripCollection.new
    fleet = Fleet.new
    trips.add_trip(Trip.new(300, 300))
    trips.add_trip(Trip.new(100, 100))
    trips.add_trip(Trip.new(200, 200))
    fleet.add_car(Car.new(20, 50, 6))
    fleet.add_car(Car.new(30, 50, 10))
    fleet.add_car(Car.new(10, 25, 5))
    sorted_trips = trips.sort_by_distance_ascending
    sorted_fleet = fleet.sort_by_range_ascending
    @roster.create_roster(sorted_trips, sorted_fleet)
    expected_string = "Trip 100 is undertaken by Car 10\nTrip 200 is undertaken by Car 20\nTrip 300 is undertaken by Car 30\n"
    assert_equal(expected_string, @roster.to_s, 'to_s returns incorrect string')
  end
  def test_empty_roster
    trips = TripCollection.new
    fleet = Fleet.new
    @roster.create_roster(trips, fleet)
    assert_equal('', @roster.to_s, 'to_s returns incorrect string')
  end

  def test_roster2
    @roster1 = TripRoster.new
    trips = TripCollection.new
    fleet = Fleet.new
    trips.add_trip(Trip.new(300, 300))
    trips.add_trip(Trip.new(100, 100))
    fleet.add_car(Diesel_car.new(20, 50, 6))
    fleet.add_car(Petrol_car.new(30, 50, 10))
    sorted_trips = trips.sort_by_distance_descending
    sorted_fleet = fleet.sort_by_most_economic
    @roster1.create_roster(sorted_trips, sorted_fleet)
    expected_string = "Trip 100 for 0 people is undertaken by 20 (Diesel) with range 300 kilometre\nTrip 300 for 0 people is undertaken by 30 (Petrol) with range 500 kilometre\n"
    assert_equal(expected_string, @roster1.to_s, 'to_s returns incorrect string')
  end

end