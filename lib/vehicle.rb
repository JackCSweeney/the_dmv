require 'date'

class Vehicle
# challenge for refactoring: remove attr_accessor and create methods to 
# change the necessary attributes here instead of other classes
  attr_accessor :registration_date,
                :plate_type,
                :vin,
                :year,
                :make,
                :model,
                :engine,
                :county

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = vehicle_details[:registration_date]
    @plate_type = vehicle_details[:plate_type]
    @county = vehicle_details[:county]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end
end
