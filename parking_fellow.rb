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

  def p_report
    result="B #{sum_vacancy} #{sum_capacity}"
    @parkingLots.each{|parkingLot|
      result ="#{result}"+"\n  #{parkingLot.p_report}"
    }
    result
  end

  def sum_capacity
    result = 0
    @parkingLots.each{|parkingLot|
      result += parkingLot.capacity
    }
    result
  end

  def sum_vacancy
    result = 0
    @parkingLots.each{|parkingLot|
      result += parkingLot.vacant_place
    }
    result
  end

  def vacant_place
    result = 0
    @parkingLots.each{|parkingLot|
      result += parkingLot.vacant_place
    }
    result
  end

  def capacity
    result = 0
    @parkingLots.each{|parkingLot|
      result += parkingLot.capacity
    }
    result
  end

  def park_by(object,car)
    @parkingLots[object].park(car)
  end

end