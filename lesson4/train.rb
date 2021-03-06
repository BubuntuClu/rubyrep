class Train
  attr_accessor :speed
  attr_reader :route, :number, :type, :cars, :index_station

  def initialize(number, type)
    @number = number
    @type = type 
    @speed = 0
    @cars = []      
  end

  def route=(route)
    @route = route
    @index_station = 0
    @route.stations[self.index_station].add_train(self)
  end

  def speed_up(speed)
    self.speed = speed if speed > 0
  end

  def current_speed
    puts "current speed: #{self.speed}"
  end

  def stop
    self.speed = 0
  end


  def add_car(car)
    self.cars << car
    show_cars_count 
  end

  def remove_car
    if self.speed == 0 && self.cars.size > 0
      self.cars.delete_at(-1)
    else
      puts "car didnt removed"
    end
    show_cars_count
  end

  def move_train
    if self.index_station == self.route.stations.size-1 
      self.index_station = 0
      self.route.stations.reverse!
    end
    current_station = self.route.stations[index_station]
    current_station.remove_train(self)
    self.index_station += 1
    current_station = self.route.stations[index_station]
    current_station.add_train(self)
  end

  def show_current_station 
    puts "current station: #{self.route.stations[self.index_station].name}"    
  end

  def show_next_station
    if self.index_station == self.route.stations.size-1
      puts "u r in the end of route"
    else
      puts "next station: #{self.route.stations[self.index_station + 1].name}"
    end
  end

  def show_prev_station
    if self.index_station == 0 
      puts "u r in the start of route"
    else
      puts "next station: #{self.route.stations[self.index_station - 1].name}"
    end
  end

  def show_train_info
    puts "number - #{number}; type - #{type}; cars count: #{car}"
  end

  protected

  # put it in protected, because we need to use this method in subclasses and dont let users change that values manualy
  attr_writer :cars, :index_station

  # put it in protected, because we need to use this method in subclasses
  def show_cars_count
    puts "cars count: #{self.cars.size}"
  end
end