class ParkingLot
  attr_accessor :cars
  def initialize(capacity)
    @capacity = capacity
    @cars = Hash.new
    @key = 0
  end

  def park(car)
    if @cars.length < @capacity
      @key += 1
      @cars[@key] = car
      return @key
    else
      return nil
    end
  end

  def pick(ticket)
    @cars.delete(ticket)
  end

  def vacant_place
   @capacity - @cars.length
  end


end