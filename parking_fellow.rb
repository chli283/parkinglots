class ParkingFellow

  def initialize(parkingLots)
    @parkingLots = parkingLots
  end

  def park(car)
    @parkingLots.each { |parkingLot|
    ticket = parkingLot.park(car)
    return ticket  if  ticket
    }
    nil
  end

  def pick(ticket)
    @parkingLots.each { |parkingLot|
    car = parkingLot.pick(ticket)
    return car if car
    }
    nil
  end

  def park_by(object,car)
    @parkingLots[object].park(car)
  end

end