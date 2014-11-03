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

  it 'Smart Parking Fellow should be able to park car' do
    @SmartparkingFellow.park("car").should_not == nil
  end

  it 'Smart Parking Fellow should be able to pick car' do
    ticket = @SmartparkingFellow.park("car")
    @SmartparkingFellow.pick(ticket).should_not == nil
  end

  it 'Smart Parking Fellow should be able to pick car when Kayla park the car herself' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(0)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket = @SmartparkingFellow.park("car")
    @parkingLot1.pick(ticket).should_not == nil
  end

  it 'Smart Parking Fellow should not be able to park car when all parking lots are full' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(0)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    @SmartparkingFellow.park("car").should == nil
  end

  it 'Smart Parking Fellow should be able to park car after pick a car from full parking lots' do
    @parkingLot1 = ParkingLot.new(0)
    @parkingLot2 = ParkingLot.new(1)
    @SmartparkingFellow =SmartParkingFellow.new([@parkingLot1,@parkingLot2])
    ticket = @SmartparkingFellow.park("car")
    @SmartparkingFellow.pick(ticket)
    @SmartparkingFellow.park("car").should_not == nil
  end

  it 'Smart Parking Fellow should be able to pick the right car when there are multi cars in parking lots' do
    ticket1 = @SmartparkingFellow.park("car1")
    ticket2 = @SmartparkingFellow.park("car2")
    @SmartparkingFellow.pick(ticket2).should == "car2"
  end

  it 'Smart Parking Fellow should not be able to pick car after the car is already picked' do
    ticket = @SmartparkingFellow.park("car")
    @SmartparkingFellow.pick(ticket)
    @SmartparkingFellow.pick(ticket).should == nil
  end

  it 'Smart Parking Fellow should be able to find sparer parkinglot to park car' do
    ticket =@SmartparkingFellow.park("car")
    @parkingLot2.pick(ticket).should == "car"
  end

  it 'Smart Parking Fellow should park a car into anyone parkinglot when vacant of parking lots is the same' do
    @parkingLot1 = ParkingLot.new(3)
    @parkingLot2 = ParkingLot.new(3)
    @SmartparkingFellow = SmartParkingFellow.new([@parkingLot1, @parkingLot2])
    @SmartparkingFellow.park("car").should_not == nil
  end

end