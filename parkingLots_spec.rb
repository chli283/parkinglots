require 'rspec'
require './parking_lot.rb'

describe ParkingLot do

  before(:each) do
    @parking_lot = ParkingLot.new(100)
  end

  it 'should be able to park a car' do
    @parking_lot.park("car").should_not == nil
  end

  it 'should not be able to park a car when parking lot is full' do
    @parking_lot = ParkingLot.new(0)
    @parking_lot.park("car").should == nil
  end

  it 'should be able to pick car' do
    ticket = @parking_lot.park("car")
    @parking_lot.pick(ticket).should == "car"
  end

  it 'should not be able to pick car when car is already picked' do
    ticket = @parking_lot.park("car")
    @parking_lot.pick(ticket)
    @parking_lot.pick(ticket).should == nil
  end

  it 'should return the correct car when there are multi cars in parking lot.' do
    ticket1 = @parking_lot.park("car1")
    ticket2 = @parking_lot.park("car2")

    @parking_lot.pick(ticket2).should == "car2"
    @parking_lot.pick(ticket1).should == "car1"
  end

  it 'should not be able to pick car when car is not parked' do
    @parking_lot.pick("invalid ticket").should == nil
  end

end