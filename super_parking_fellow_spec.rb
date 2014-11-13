require 'rspec'
require './parking_lot.rb'
require './parking_fellow.rb'
require './super_parking_fellow.rb'

describe 'SuperParkingFellow' do

  it 'should be able to pick car when Kayla park the car herself' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @SuperparkingFellow =SuperParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket = @SuperparkingFellow.park("car")
    @parkingLot1.pick(ticket).should_not == nil
  end

  it 'should be able to pick the right car when there are multi cars in parking lots' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1, @parkingLot2])

    ticket1 = @SuperparkingFellow.park("car1")
    ticket2 = @SuperparkingFellow.park("car2")
    @SuperparkingFellow.pick(ticket2).should == "car2"
  end

  it 'should not be able to park car when all parking lots are full' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @SuperparkingFellow =SuperParkingFellow.new([@parkingLot1,@parkingLot2])
    @parkingLot1.park("car1")
    @parkingLot2.park("car2")
    @SuperparkingFellow.park("car3").should == nil
  end

  it 'should be able to park car after pick a car from full parking lots' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @SuperparkingFellow =SuperParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket = @SuperparkingFellow.park("car")
    @SuperparkingFellow.pick(ticket)
    @SuperparkingFellow.park("car").should_not == nil
  end

  it 'should not be able to pick car after the car is already picked' do
      @parkingLot1 = ParkingLot.new(10)
      @parkingLot2 = ParkingLot.new(10)
    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1, @parkingLot2])
    ticket = @SuperparkingFellow.park("car")
    @SuperparkingFellow.pick(ticket)
    @SuperparkingFellow.pick(ticket).should == nil
  end

  it 'should be able to  park a  car when having mult(3) parkingLots' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @parkingLot3 = ParkingLot.new(1)

    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1, @parkingLot2,@parkingLot3])
    @SuperparkingFellow.park("car").should_not == nil
  end

  it 'should  park a  car to parkingLot2 when parkingLot2  not parking any car and pakingLot1 parking one car' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(10)
    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1, @parkingLot2])
    @parkingLot1.park("car1")

    ticket = @SuperparkingFellow.park("car2")
    @parkingLot2.pick(ticket).should == "car2"
  end

  it 'should  park a  car when parkingLot2  parking same two cars with pakingLot1 following their same capacity10.' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot1.park("car1")
    @parkingLot2 = ParkingLot.new(10)
    @parkingLot2.park("car2")

    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1, @parkingLot2])
    ticket = @SuperparkingFellow.park("car3")
    @SuperparkingFellow.pick(ticket).should == "car3"
  end

  it 'should  park a  car to parkingLot2 when parkingLot2  parked one car and pakingLot1 parking two cars with their same capacity 10' do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot1.park("car1")
    @parkingLot1.park("car2")
    @parkingLot2 = ParkingLot.new(10)
    @parkingLot2.park("car3")

    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1, @parkingLot2])
    ticket = @SuperparkingFellow.park("car4")
    @parkingLot2.pick(ticket).should == "car4"
  end

  it 'should park a car to big_parkingLot  when big_parkingLot having higher vacacy rate than small_pakingLot' do
    @parkingLot_big = ParkingLot.new(5)
    @parkingLot_big.park("car1")
    @parkingLot_small = ParkingLot.new(2)
    @parkingLot_small.park("car2")

    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot_big, @parkingLot_small])
    ticket = @SuperparkingFellow.park("car3")
    @parkingLot_big.pick(ticket).should == "car3"
  end

  it 'should park a  car to small_parkingLot  when small_parkingLot  having higher vacacy rate than big_pakingLot' do
    @parkingLot_big = ParkingLot.new(5)
    @parkingLot_big.park("car1")
    @parkingLot_big.park("car3")
    @parkingLot_big.park("car4")
    @parkingLot_small = ParkingLot.new(2)
    @parkingLot_small.park("car2")

    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot_big, @parkingLot_small])
    ticket = @SuperparkingFellow.park("car5")
    @parkingLot_small.pick(ticket).should == "car5"
  end

  it 'should  be able to park a car when parkinglots are not full with anyone parkinglot capacity null'  do
    @parkingLot1 = ParkingLot.new(10)
    @parkingLot2 = ParkingLot.new(0)
    @SuperparkingFellow = SuperParkingFellow.new([@parkingLot1,@parkingLot2])

    ticket =@SuperparkingFellow.park("car")
    @SuperparkingFellow.pick(ticket).should =="car"
    end

end