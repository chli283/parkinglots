class ParkingLot

  def initialize(capacity)
    @capacity = capacity
    @cars = Hash.new
    @@key = 0
  end

  def park(car)
    while (@cars.length < @capacity) do
      @@key += 1
      @cars[@@key] = car
      return @@key
      car
    end
    nil
  end

  def pick(ticket)
    @cars.delete(ticket)
  end


  def vacant_place
    @capacity - @cars.length
  end

  def vacancy_rate
   vacant_place.to_f/@capacity.to_f
  end


end