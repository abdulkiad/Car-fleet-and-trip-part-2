require_relative 'carbon_fuel'

class Diesel_car< Carbon_fuel


    def initialize(id, litres_in_tank, km_per_litre)

      super(id, litres_in_tank, km_per_litre)
      @unit_price=1.20
      @number_of_seats=7
      @car_type="Diesel"
      @car_str=true
    end



  end
