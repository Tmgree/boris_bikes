require_relative 'bike'


class DockingStation

  attr_accessor :capacity
attr_reader :bikes
  DEFAULT_CAPACITY=20
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes=[]
    @capacity=capacity
  end
def release_bike
  fail "no bikes" if empty?
  @bikes.pop
end
def dock(bike)

  fail "error full" if full?
  @bikes << bike
end
private

def empty?
@bikes.size == 0 ? true : false

end

def full?
  @bikes.size >= @capacity ? true : false
end

end
