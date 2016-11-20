require_relative 'modules/validator'

class CargoCar < Car
  include Validator
  attr_reader :hold_place

  def initialize(type, capacity)
    @capacity = capacity
    @hold_place = 0
    super(type)
  end

  def add_cargo(value)
    if cargo_validate!(value)
      if value >= @capacity
        puts 'too heavy cargo'
      else
        @hold_place = value
      end
    end
  end

  def show_free_space
    @capacity - @hold_place
  end

  def show_info
    puts "this car is #{type} and got capacity #{capacity} ton"
  end

  private

  # put this in private because i dont want let user use getter on capacity.
  # they should use show_info
  attr_reader :capacity
  def validate!
    raise 'NOT VALID TYPE!' if type !~ /^(cargo)$/i
    raise 'NOT VALID CAPACITY!' if capacity.to_i < 0
    true
  end

  def cargo_validate!(value)
    raise 'NOT VALID value!' if value < 0
    true
  end
end
