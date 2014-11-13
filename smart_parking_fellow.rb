class SmartParkingFellow < ParkingFellow

  def park(car)
    @parkingLots[more_vacanty].park(car)
  end

  def more_vacanty
    result = 0
    @parkingLots.each { |parkingLot|
      result += 1 if parkingLot.vacant_place > @parkingLots[result].vacant_place
    }
    result
  end

end