class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    plate_maker(vehicle)
    fee_collector(vehicle)
    @registered_vehicles << vehicle
  end

  def plate_maker(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def fee_collector(vehicle)
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end
end
