class SmartParkingFellow < ParkingFellow

  def park(car)
    park_by(more_vacanty,car)
  end

  def more_vacanty
    result = 0
    @parkingLots.each { |parkingLot|
      result += 1 if parkingLot.vacant_place > @parkingLots[result].vacant_place
    }
    result
  end

end