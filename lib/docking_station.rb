require_relative 'bike'


class DockingStation
  attr_reader :bikes
  def initialize
    @bikes=[]
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
  @bikes.size == 20 ? true : false
end

end
