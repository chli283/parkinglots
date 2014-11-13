require 'rspec'
require './parking_lot.rb'
require './parking_fellow.rb'
require './smart_parking_fellow.rb'

describe 'Smart parking fellow' do
  before(:each) do
    @parkingLot1 = ParkingLot.new(50)
    @parkingLot2 = ParkingLot.new(100)
    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot1, @parkingLot2])
  end

  it 'should be able to park car' do
    @SmartparkingFellow.park("car").should_not == nil
  end

  it 'should be able to pick car' do
    ticket = @SmartparkingFellow.park("car")
    @SmartparkingFellow.pick(ticket).should_not == nil
  end

  it 'should be able to pick car when Kayla park the car herself' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(0)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket = @SmartparkingFellow.park("car")
    @parkingLot1.pick(ticket).should_not == nil
  end

  it 'should not be able to park car when all parking lots are full' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(0)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    @SmartparkingFellow.park("car").should == nil
  end

  it 'should be able to park car after pick a car from full parking lots' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(1)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket = @SmartparkingFellow.park("car")
    @SmartparkingFellow.pick(ticket)
    @SmartparkingFellow.park("car").should_not == nil
  end

  it 'should be able to pick the right car when there are multi cars in parking lots' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket1 = @SmartparkingFellow.park("car1")
    ticket2 = @SmartparkingFellow.park("car2")
    @SmartparkingFellow.pick(ticket2).should == "car2"
    @SmartparkingFellow.pick(ticket1).should == "car1"
  end

  it 'should not be able to pick car after the car is already picked' do
    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot1, @parkingLot2])
    ticket = @SmartparkingFellow.park("car")
    @SmartparkingFellow.pick(ticket)
    @SmartparkingFellow.pick(ticket).should == nil
  end

  it 'should  park a car to parkingLot2 when parkingLot1 parked more cars than pakingLot2  with their same capacity' do
    @parkingLot1 = ParkingLot.new(3)
    @parkingLot1.park("car1")
    @parkingLot2 = ParkingLot.new(3)
    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot1, @parkingLot2])

    ticket =@SmartparkingFellow.park("car2")
    @parkingLot2.pick(ticket).should == "car2"
  end

  it 'should  park a car when parkingLot1 parked same cars with pakingLot2 following their same capacity' do
    @parkingLot1 = ParkingLot.new(3)
    @parkingLot1.park("car1")
    @parkingLot2 = ParkingLot.new(3)
    @parkingLot2.park("car2")
    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot1, @parkingLot2])

    ticket =@SmartparkingFellow.park("car3")
    @SmartparkingFellow.pick(ticket).should == "car3"
  end

  it 'should park a car to parkingLot_small when parkingLot_small having more vacancy than parkingLot_big' do
    @parkingLot_small = ParkingLot.new(3)
    @parkingLot_small.park("car1")

    @parkingLot_big = ParkingLot.new(4)
    @parkingLot_big.park("car2")
    @parkingLot_big.park("car3")
    @parkingLot_big.park("car4")
    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot_small, @parkingLot_big])

    ticket =@SmartparkingFellow.park("car5")
    @parkingLot_small.pick(ticket).should == "car5"
  end

  it 'should be able to  park a  car when having mult(3) parkingLots' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @parkingLot3 = ParkingLot.new(1)

    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot1, @parkingLot2,@parkingLot3])
    @SmartparkingFellow.park("car").should_not == nil
  end


end