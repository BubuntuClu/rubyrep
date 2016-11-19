require_relative 'modules/validator'

class PassengerCar < Car
  include Validator
  attr_reader :hold_place

  def initialize(type, sleeps)
    @sleeps = sleeps
    @hold_place = 0
    super(type)
  end

  def add_passenger
    if @hold_place == @sleeps
      puts "no more free space for passengers"
    else
      @hold_place += 1
    end
  end

  def show_free_space
    @sleeps - @hold_place
  end

  def show_info
    puts "this car is #{type} and got place for #{sleeps} ppl"
  end

 private

 #put this in private because i dont want let user use getter on sleeps. they should use show_info
  attr_reader :sleeps
  def validate!
    raise "NOT VALID TYPE!" if type !~ /^(passenger)$/i
    raise "NOT VALID SLEEPS PLACE!" if sleeps.to_i < 10
    true
  end
end

  
  