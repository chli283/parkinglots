require 'rspec'
require './parking_lot.rb'
require './parking_fellow.rb'
require './manager.rb'
require './smart_parking_fellow.rb'
require './super_parking_fellow.rb'
require './director.rb'

describe 'Director' do

  it 'should report "M 1 1 \n P 1 1" when 1 manager manage one parkinglot' do
    @parkingLot = ParkingLot.new(1)
    @Manager = Manager.new([@parkingLot])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 1 1\n P 1 1"
  end

  it 'should report "M 1 2\n P 1 2" when managing one parkinglot parked a car with capacity 2' do
    @parkingLot = ParkingLot.new(2)
    @Manager = Manager.new([@parkingLot])
    @Manager.park("car")
    @Director = Director.new([@Manager])
    @Director.report.should =="M 1 2\n P 1 2"
  end

  it 'should report "M 2 2\n P 1 1 \n P 1 1"when managing two parkinglots without parking anyone car' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @Manager = Manager.new([@parkingLot1,@parkingLot2])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 2 2\n P 1 1\n P 1 1"
  end

  it 'should report "M 1 2\n P 1 1\n P 0 1"when manageing two parkinglots one of which paring a car' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @parkingLot2.park("car")
    @Manager = Manager.new([@parkingLot1,@parkingLot2])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 1 2\n P 1 1\n P 0 1"
  end

  it 'should report "M 0 2\n P 0 1\n P 0 1"when manageing two parkinglots which parking a car' do
    @parkingLot1 = ParkingLot.new(1)
    @parkingLot2 = ParkingLot.new(1)
    @parkingLot1.park("car1")
    @parkingLot2.park("car2")
    @Manager = Manager.new([@parkingLot1,@parkingLot2])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 0 2\n P 0 1\n P 0 1"
    end

  it 'should report "M 1 1\n B 1 1\n P 1 1"when managing one basic Fellow' do
    @parkingLot = ParkingLot.new(1)
    @parkingfellow = ParkingFellow.new([@parkingLot])
    @Manager = Manager.new([@parkingfellow])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 1 1\n B 1 1\n  P 1 1"
  end

  it 'should report "M 2 4\n P 1 2\n B 1 2\n P 1 2"when managing one parkinglot parked a car and one basic Fellow parked a car' do
    @parkingLot = ParkingLot.new(2)
    @parkingLot.park("car")

    @parkingLot_by_fellow = ParkingLot.new(2)
    @parkingfellow = ParkingFellow.new([@parkingLot_by_fellow])
    @parkingfellow.park("car_fellow")

    @Manager = Manager.new([@parkingLot,@parkingfellow])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 2 4\n P 1 2\n B 1 2\n  P 1 2"
  end
  
  it 'should report "M 4 4\n P 1 1\n B 1 1\n P 1 1 \n B 1 1\n  P 1 1\n  P 1 1"when managing one parkinglot and two Fellows' do
    @parkingLot = ParkingLot.new(1)

    @parkingLot_by_fellow = ParkingLot.new(1)
    @parkingfellow = ParkingFellow.new([@parkingLot_by_fellow])

    @parkingLot1_by_smartfellow = ParkingLot.new(1)
    @parkingLot2_by_smartfellow = ParkingLot.new(1)
    @parkingSmartfellow = ParkingFellow.new([@parkingLot1_by_smartfellow,@parkingLot2_by_smartfellow])

    @Manager = Manager.new([@parkingLot,@parkingfellow,@parkingSmartfellow])
    @Director = Director.new([@Manager])
    @Director.report.should =="M 4 4\n P 1 1\n B 1 1\n  P 1 1\n B 2 2\n  P 1 1\n  P 1 1"
  end
  
  it 'should report "M 5 20\n P 2 10\n B 2 5\n P 2 5 \n B 1 5\n P 0 3\n P 1 2\n"when managing one parkinglot and two Fellows' do
    @parkingLot = ParkingLot.new(10)
    @parkingLot.park("car1")
    @parkingLot.park("car2")
    @parkingLot.park("car3")
    @parkingLot.park("car4")
    @parkingLot.park("car5")
    @parkingLot.park("car6")
    @parkingLot.park("car7")
    @parkingLot.park("car8")

    @parkingLot_by_fellow = ParkingLot.new(5)
    @parkingfellow = ParkingFellow.new([@parkingLot_by_fellow])
    @parkingfellow.park("car1_fellow")
    @parkingfellow.park("car2_fellow")
    @parkingfellow.park("car3_fellow")

    @parkingLot1_by_smartfellow = ParkingLot.new(3)
    @parkingLot2_by_smartfellow = ParkingLot.new(2)
    @parkingSmartfellow = ParkingFellow.new([@parkingLot1_by_smartfellow,@parkingLot2_by_smartfellow])
    @parkingSmartfellow.park("car1_by_smartfellow")
    @parkingSmartfellow.park("car2_by_smartfellow")
    @parkingSmartfellow.park("car3_by_smartfellow")
    @parkingSmartfellow.park("car4_by_smartfellow")

    @Manager = Manager.new([@parkingLot,@parkingfellow,@parkingSmartfellow])
    @Director = Director.new([@Manager])
    @Director.report.should == "M 5 20\n P 2 10\n B 2 5\n  P 2 5\n B 1 5\n  P 0 3\n  P 1 2"
  end


end