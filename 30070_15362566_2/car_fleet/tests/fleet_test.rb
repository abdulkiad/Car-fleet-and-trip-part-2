require 'test/unit'
require_relative '../fleet.rb'

class FleetTest < Test::Unit::TestCase

  def setup
    @fleet = Fleet.new
    @fleet.add_car(Car.new(1234, 10, 30))
    @fleet.add_car(Car.new(3456, 10, 20))
    @fleet.add_car(Car.new(5678, 10, 10))
  end

  def test_sort_by_range_ascending
    fleet = @fleet.sort_by_range_ascending
    assert_equal(5678, fleet.cars[0].id, 'Sort order incorrect')
    assert_equal(3456, fleet.cars[1].id, 'Sort order incorrect')
    assert_equal(1234, fleet.cars[2].id, 'Sort order incorrect')
  end

  def test_sort_by_price_ascending
    @fleet1 = Fleet.new
    @fleet1.add_car(Diesel_car.new(1234, 10, 3))
    @fleet1.add_car(Petrol_car.new(3456, 10, 2))
    @fleet1.add_car(Electrical_car.new(345, 10, 2))

    fleet= @fleet1.sort_by_most_economic
    assert_equal(3456, fleet.cars[2].id, 'Sort order incorrect')
    assert_equal(1234, fleet.cars[1].id, 'Sort order incorrect')
    assert_equal(345, fleet.cars[0].id, 'Sort order incorrect')

  end


end