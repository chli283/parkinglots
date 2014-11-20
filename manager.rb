class Manager < ParkingFellow

  def report
    result = ""
    @parkingLots.each{|parkingLot|
     result ="#{result}"+"\n #{parkingLot.p_report}"
    }
    "M #{sum_vacancy} #{sum_capacity}#{result}"
  end

end