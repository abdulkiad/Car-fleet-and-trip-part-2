require 'test/unit'
require_relative '../electrical_car'

class CarTest < Test::Unit::TestCase
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @my_car = Electrical_car.new(1234, 50, 10)
  end


  def test_range1
    assert_equal(500, @my_car.range_in_km, 'Range incorrect')
  end
end