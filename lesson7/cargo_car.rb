require_relative 'modules/validator'

class CargoCar < Car
  include Validator

  def initialize(type, capacity)
    @capacity = capacity
    super(type)    
  end

  def show_info
    puts "this car is #{type} and got capacity #{capacity} ton"
  end


  private

  #put this in private because i dont want let user use getter on capacity. they should use show_info
  attr_reader :capacity
  def validate!
    raise "NOT VALID TYPE!" if type !~ /^(cargo)$/i
    raise "NOT VALID CAPACITY!" if capacity.to_i < 0
    true
  end
end