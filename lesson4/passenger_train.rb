class PassengerTrain < Train
  def add_car(car)
    if car.instance_of?(PassengerCar)
      super(car) 
    else
      puts "this train cant contain this type of car"
    end
  end 
end
