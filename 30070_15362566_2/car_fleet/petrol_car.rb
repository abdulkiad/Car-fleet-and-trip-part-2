require_relative 'carbon_fuel'

class Petrol_car < Carbon_fuel

  def initialize(id, litres_in_tank, km_per_litre)
   super(id, litres_in_tank, km_per_litre)

   @number_of_seats=5
   @unit_price=1.35
   @car_type="Petrol"
   @car_str=true
  end



end

