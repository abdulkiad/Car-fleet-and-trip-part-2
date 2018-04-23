require 'test/unit'
require_relative '../trip.rb'

class TripTest < Test::Unit::TestCase

  def setup
    @my_trip = Trip.new(1234, 100)
  end

  def test_id
    assert_equal(1234, @my_trip.id, 'Incorrect id')
  end

  def test_distance
    assert_equal(100, @my_trip.distance, 'Incorrect distance')
  end
  
end