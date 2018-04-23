require 'test/unit'
require_relative '../car.rb'

class CarTest < Test::Unit::TestCase

  def setup
    @my_car = Car.new(1234, 50, 10)
  end

  def test_range
    assert_equal(500, @my_car.range_in_km, 'Range incorrect')
  end

  def test_price_per_km
    @my_car2 = Diesel_car.new(1234, 50, 10)
    assert_equal(0.12, @my_car2.price_per_km, 'price per kilometere incorrect')
  end




end