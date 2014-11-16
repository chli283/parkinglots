require 'rspec'
require './parking_lot.rb'
require './parking_fellow.rb'
require './manager.rb'
require './smart_parking_fellow.rb'
require './super_parking_fellow.rb'

describe 'manager' do

  before(:each) do
    @parkingLot1 = ParkingLot.new(50)
    @parkingLot2 = ParkingLot.new(100)
    @Manager = Manager.new([@parkingLot1, @parkingLot2])
  end

  it 'should be able to park car' do
    @parkingLot1 = ParkingLot.new(50)
    @parkingLot2 = ParkingLot.new(100)
    @Manager = Manager.new([@parkingLot1, @parkingLot2])
    @Manager.park("car").should_not == nil
  end

  it 'should be able to pick car' do
    @parkingLot1 = ParkingLot.new(50)
    @parkingLot2 = ParkingLot.new(100)
    @Manager = Manager.new([@parkingLot1, @parkingLot2])
    ticket = @Manager.park("car")
    @Manager.pick(ticket).should_not == nil
  end

  it 'should not be able to park car when all parking lots are full' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(0)
    @Manager =Manager.new([@parkingLot1, @parkingLot2])
    @Manager.park("car").should == nil
  end

  it 'should be able to park car after pick a car from full parking lots' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(1)
    @Manager =Manager.new([@parkingLot1, @parkingLot2])
    ticket = @Manager.park("car")
    @Manager.pick(ticket)
    @Manager.park("car").should_not == nil
  end

  it 'should be able to pick the right car when there are multi cars in parking lots' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @Manager =Manager.new([@parkingLot1, @parkingLot2])
    ticket1 = @Manager.park("car1")
    ticket2 = @Manager.park("car2")
    @Manager.pick(ticket2).should == "car2"
    @Manager.pick(ticket1).should == "car1"
  end

  it 'should not be able to pick car after the car is already picked' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @Manager = Manager.new([@parkingLot1, @parkingLot2])
    ticket = @Manager.park("car")
    @Manager.pick(ticket)
    @Manager.pick(ticket).should == nil
  end

  it 'should be able to pick car when Kayla park the car herself' do
    @parkingLot1 = ParkingLot.new(100)
    @parkingLot2 = ParkingLot.new(100)
    @Manager = Manager.new([@parkingLot1, @parkingLot2])
    ticket =  @parkingLot1.park("car")
    @Manager.pick(ticket).should == "car"
  end

  it 'Kayla should be able to pick car herself when the car is parked by PM' do
    @parkingLot1 = ParkingLot.new(100)
    @parkingLot2 = ParkingLot.new(100)
    @Manager = Manager.new([@parkingLot1, @parkingLot2])
    ticket =  @Manager.park("car")
    car = @Manager.pick(ticket)
    if car != nil
      car.should == "car"
    else
      @parkingLot2.pick(ticket).should == "car"
    end
  end

  it 'should be  able to manager one fellow' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @parkingFellow = ParkingFellow.new([@parkingLot1,@parkingLot2])
    @Manager = Manager.new([@parkingFellow])

    @Manager.park("car").should_not == nil
  end

  it 'should manager one fellow to pick  a right car when parking mult cars' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @parkingFellow = ParkingFellow.new([@parkingLot1,@parkingLot2])
    @Manager = Manager.new([@parkingFellow])

    ticket1 = @Manager.park("car1")
    ticket2 = @Manager.park("car2")
    @Manager.pick(ticket2).should == "car2"
  end

  it 'should be able to manager mult fellows(basic,smart,super)'  do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @parkingLot3 = ParkingLot.new(1)
    @parkingLot4 = ParkingLot.new(1)
    @parkingLot5 = ParkingLot.new(1)
    @parkingFellow = ParkingFellow.new([@parkingLot1,@parkingLot2])
    @SmartParkingFellow = SmartParkingFellow.new([@parkingLot3,@parkingLot4])
    @SuperParkingFellow = SuperParkingFellow.new([@parkingLot5])
    @Manager = Manager.new([@parkingFellow,@SmartParkingFellow,@SuperParkingFellow])

    @Manager.park("car1").should_not == nil
    @Manager.park("car2").should_not == nil
    @Manager.park("car3").should_not == nil
    @Manager.park("car4").should_not == nil
    @Manager.park("car5").should_not == nil
  end

  it 'should manager mult fellows to pick right car when park mult cars'  do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @parkingLot3 = ParkingLot.new(1)
    @parkingLot4 = ParkingLot.new(1)
    @parkingLot5 = ParkingLot.new(1)
    @parkingFellow = ParkingFellow.new([@parkingLot1,@parkingLot2])
    @SmartParkingFellow = SmartParkingFellow.new([@parkingLot3,@parkingLot4])
    @SuperParkingFellow = SuperParkingFellow.new([@parkingLot5])
    @Manager = Manager.new([@parkingFellow,@SmartParkingFellow,@SuperParkingFellow])

    ticket1 = @Manager.park("car1")
    ticket2 = @Manager.park("car2")
    ticket3 = @Manager.park("car3")
    ticket4 = @Manager.park("car4")
    ticket5 = @Manager.park("car5")
    @Manager.pick(ticket4).should == "car4"
    @Manager.pick(ticket5).should == "car5"
    @Manager.pick(ticket3).should == "car3"
  end

  it 'should manager superFellow to park car by best vacancy rate' do
    @parkingLot1 = ParkingLot.new(2)
    @parkingLot2 = ParkingLot.new(5)

    @SuperParkingFellow = SuperParkingFellow.new([@parkingLot1,@parkingLot2])
    @Manager = Manager.new([@SuperParkingFellow])
    @parkingLot1.park("car1")
    @parkingLot2.park("car2")
    @parkingLot2.park("car3")
    @parkingLot2.park("car4")

    ticket = @Manager.park("car5")
    @parkingLot1.pick(ticket).should =="car5"
  end

  it 'should manager SmartFellow to park car by most vacancy.' do
    @parkingLot1 = ParkingLot.new(2)
    @parkingLot2 = ParkingLot.new(3)

    @SmartParkingFellow = SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    @Manager = Manager.new([@SmartParkingFellow])
    @parkingLot1.park("car1")
    @parkingLot2.park("car2")


    ticket = @Manager.park("car3")
    @parkingLot2.pick(ticket).should =="car3"
  end


end