class SmartParkingFellow

  def initialize(parkingLots)
    @parkingLots = parkingLots
  end

  def park(car)
    @parkingLots[search_parkinglot-1].park(car)
  end

  def pick(ticket)
    @parkingLots.each {|parkingLot|
      car=parkingLot.pick(ticket)
      return car if car
    }
    nil
  end

  def search_parkinglot
    return 1 if @parkingLots[0].vacant_place > @parkingLots[1].vacant_place
    return 2
  end

end