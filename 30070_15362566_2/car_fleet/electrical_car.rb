    require_relative 'car'

    class Electrical_car < Car

    def initialize(id,kilowatt_left, kilowatt_per_km)

        super(id,kilowatt_left, kilowatt_per_km)
        @number_of_seats=4
        @unit_price=0.25
        @car_type="Electrical"
        @unit_price=0
        @car_str=true
    end


    end

