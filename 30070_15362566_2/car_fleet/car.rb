
  class Car
    attr_reader :id

    def initialize(id, car_fuel, km_per_unit)
      @id, @car_fuel, @km_per_unit,@car_type,  @unit_price= id, car_fuel, km_per_unit,'Neutral',0
      @number_of_seats=0
      @car_str= false
      @car_assigned_trip=false
    end

    def range_in_km
      @car_fuel * @km_per_unit
    end

    def to_s
      "Car #{@id} with range #{range_in_km}"
    end
#used to check if its general car or specfied ie petrol
    def specific_car
      @car_str
    end

    def assign_car_trip
      @car_assigned_trip=true
      @number_of_seats=0
    end

    def car_type_s
      @car_type
    end

    def num_available_seats
     @number_of_seats
    end
#used to check if car is free
    def assigned_car
      @car_assigned_trip==true
    end

    def price_per_km
       @unit_price.to_f/@km_per_unit
    end
  end