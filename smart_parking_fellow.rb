class SmartParkingFellow < ParkingFellow

  def park(car)
    @parkingLots[more_vacanty].park(car)
  end

  def more_vacanty
    result = 0
    i =0
    @parkingLots.each { |parkingLot|
      result = i if parkingLot.vacant_place > @parkingLots[result].vacant_place
      i+=1
    }
    result
  end

end