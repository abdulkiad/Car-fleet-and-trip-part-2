
# Fleet represents a collections of cars

class Fleet

  attr_reader :cars

  def initialize(cars = nil)
    @cars = cars.equal?(nil) ? [] : cars
  end

  def add_car(car)
    @cars.push(car)
  end

  def sort_by_range_ascending
    cars = @cars.sort{|c1, c2| c1.range_in_km <=> c2.range_in_km}
    Fleet.new(cars)
  end

  def sort_by_most_economic
    cars = @cars.sort{|c1, c2| c1.price_per_km <=> c2.price_per_km}
    Fleet.new(cars)
  end


end