class PassengerCar < Car

  def initialize(type, sleeps)
    super(type)
    @sleeps = sleeps
  end

  def show_info
    puts "this car is #{type} and got place for #{sleeps} ppl"
  end

 private

 #put this in private because i dont want let user use getter on sleeps. they should use show_info
  attr_reader :sleeps

end

  
  