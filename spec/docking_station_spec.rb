require 'docking_station'

describe DockingStation do
it {is_expected.to respond_to :release_bike}



it {is_expected.to respond_to(:dock).with(1).argument}

it 'should allow a bike to dock' do
  bike = Bike.new
  subject.dock(bike)
  expect(subject.release_bike).to eq bike
end

it 'should respond to method bike' do
  expect(subject).to respond_to :bikes
end

it "Should show a docked bike" do
bike = Bike.new
subject.dock(bike)
expect(subject.release_bike).to eq bike
end

it "If nothing is set it will use defult capacity" do

expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
end

it "The user is allowed to set the capacity" do

station=DockingStation.new(50)
50.times {station.dock Bike.new}
expect{ station.dock Bike.new }.to raise_error 'error full'


end

describe 'initialization' do
  subject { DockingStation.new }
  let(:bike) { Bike.new }
  it 'defaults capacity' do
    DockingStation::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike) }.to raise_error 'error full'
  end
end

describe '#release_bike' do
  it 'releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike


  end
  it 'shows an error if station is empty' do
    expect{ subject.release_bike}.to raise_error("no bikes")
  end
it 'error too many bikes docked' do

  subject.capacity.times {subject.dock(Bike.new)}

  expect{subject.dock(Bike.new)}.to raise_error("error full")
end

end

end
