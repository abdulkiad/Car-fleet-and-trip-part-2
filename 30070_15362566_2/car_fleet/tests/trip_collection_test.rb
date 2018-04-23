require 'test/unit'
require_relative '../trip_collection.rb'

class TripCollectionTest < Test::Unit::TestCase

  def setup
    @trips = TripCollection.new
    @trips.add_trip(Trip.new(1234, 300))
    @trips.add_trip(Trip.new(3456, 100))
    @trips.add_trip(Trip.new(2345, 200))
  end

  def test_sort_by_distance_ascending
    trips = @trips.sort_by_distance_ascending
    assert_equal(3456, trips.trips[0].id, 'Sort order incorrect')
    assert_equal(2345, trips.trips[1].id, 'Sort order incorrect')
    assert_equal(1234, trips.trips[2].id, 'Sort order incorrect')
  end

  def test_sort_by_distance_descending
    trips = @trips.sort_by_distance_descending
    assert_equal(3456, trips.trips[2].id, 'Sort order incorrect')
    assert_equal(2345, trips.trips[1].id, 'Sort order incorrect')
    assert_equal(1234, trips.trips[0].id, 'Sort order incorrect')
  end
end