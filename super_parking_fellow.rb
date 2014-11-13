class SuperParkingFellow < ParkingFellow

  def park(car)
    @parkingLots[higher_vacancy_rate].park(car)
  end


  def higher_vacancy_rate
    result = 0
    @parkingLots.each { |parkingLot|
      result += 1 if parkingLot.vacancy_rate > @parkingLots[result].vacancy_rate
    }
    result
  end


end