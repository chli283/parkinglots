class Manager < ParkingFellow

  #def sum_capacity
  #  result = 0
  #  @parkingLots.each{|parkingLot|
  #    result += parkingLot.capacity
  #  }
  #  result
  #end
  #
  #def sum_vacancy
  #  result = 0
  #  @parkingLots.each{|parkingLot|
  #    result += parkingLot.vacant_place
  #  }
  #  result
  #end

  def report
    result = ""
    @parkingLots.each{|parkingLot|
     result ="#{result}"+"\n #{parkingLot.p_report}"
    }
    "M #{sum_vacancy} #{sum_capacity}#{result}"
  end

end