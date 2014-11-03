require 'rspec'
require './parking_lot.rb'
require './parking_fellow.rb'


describe ParkingFellow do

  before(:each) do
    @parkingLot1 = ParkingLot.new(100)
    @parkingLot2 = ParkingLot.new(100)
    @parkingFellow = ParkingFellow.new([@parkingLot1, @parkingLot2])
  end

  it 'Parking Fellow should be able to park car' do
    @parkingFellow.park("car").should_not == nil
  end

  it 'Parking Fellow should be able to pick car' do
    ticket = @parkingFellow.park("car")
    @parkingFellow.pick(ticket).should == "car"
  end

  it 'Parking Fellow should not be able to park car when all parking lots are full' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(0)
    @parkingFellow = ParkingFellow.new([@parkingLot1, @parkingLot2])
    @parkingFellow.park("car").should == nil
  end

  it 'Parking Fellow should be able to park car when one of the parking lots is not full' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(1)
    @parkingFellow = ParkingFellow.new([@parkingLot1, @parkingLot2])
    @parkingFellow.park("car").should_not == nil
  end

  it 'Parking Fellow should be able to park car after pick a car from full parking lots' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(1)
    @parkingFellow = ParkingFellow.new([@parkingLot1, @parkingLot2])
    ticket = @parkingFellow.park("car1")
    @parkingFellow.pick(ticket)
    @parkingFellow.park("car2").should_not == nil
  end

  it 'Parking Fellow should be able to pick the right car when there are multi cars in parking lots' do
    ticket1 = @parkingFellow.park("car1")
    ticket2 = @parkingFellow.park("car2")
    @parkingFellow.pick(ticket1).should =="car1"
    @parkingFellow.pick(ticket2).should =="car2"
  end

  it 'Parking Fellow should not be able to pick car after the car is already picked' do
    ticket = @parkingFellow.park("car")
    @parkingFellow.pick(ticket)
    @parkingFellow.pick(ticket).should == nil
  end

  it 'Parking Fellow should be able to pick car when Kayla park the car herself' do
    ticket =  @parkingLot1.park("car")
    @parkingFellow.pick(ticket).should == "car"
  end

  it 'Kayla should be able to pick car herself when the car is parked by Parking Fellow' do
    ticket =  @parkingFellow.park("car")
    car = @parkingLot1.pick(ticket)
    if car != nil
      car.should == "car"
    else
      @parkingLot2.pick(ticket).should == "car"
    end
  end

end