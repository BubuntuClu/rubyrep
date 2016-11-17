class CargoCar < Car
  def initialize(type, capacity)
    super(type)
    @capacity = capacity
  end

  def show_info
    puts "this car is #{type} and got capacity #{capacity} ton"
  end

  private

  #put this in private because i dont want let user use getter on capacity. they should use show_info
  attr_reader :capacity
end