class Manager

  def initialize(parkingLot)
     @parkingLotPM = parkingLot
  end

  def park(car)
    @parkingLotPM.each { |parkingLot|
      ticket = parkingLot.park(car)
      return ticket  if  ticket
    }
    nil
  end

  def pick(ticket)
    @parkingLotPM.each { |parkingLot|
      car = parkingLot.pick(ticket)
      return car if car
    }
    nil
  end



end