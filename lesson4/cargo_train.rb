class CargoTrain < Train

  def add_car(car)
    if car.instance_of?CargoCar   
      self.cars << car 
    else
      puts "this train cant contain this type of car"
    end
    show_cars_count 
  end  

end