class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end
 
  def add_train(train)
    @trains << train
    puts "on station #{self.name} train has arrived. count of trains is #{trains_count}"
  end

  def show_all_trains
    puts "the list of trains on #{self.name} :"
    @trains.each { |train| train.show_train_info }
  end

  def show_typed_trains(type)
    puts "the list of #{type} trains on #{self.name} :"
    @trains.each { |train| train.show_train_info if train.type == type }
  end

  def remove_train(train)
    @trains.delete(train)
  end


  def trains_count
    @trains.size
  end
end

class Route
  
  attr_reader :start_station, :end_station, :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station 
    @stations = [start_station, end_station]
  end

  def add_station(station)
    self.stations.insert(-2, station)
  end

  def remove_station(station)
    if station.trains_count == 0
      self.stations.delete(station)    
    else
      puts "there are some trains on the station. u cant delete it"
    end
  end

  def show_stations
    puts "first station is - #{@start_station.name} "
    self.stations.each { |station| puts "next station is - #{station.name}" }
    puts "last station is - #{@end_station.name} "
  end
end

class Train

  attr_accessor :speed, :car, :index_station
  attr_reader :route, :number, :type

  def initialize(number, type, car)
    @number = number
    @type = type 
    @car = car
    @speed = 0      
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

  def show_cars_count
    puts "cars count: #{self.car}"
  end

  def add_car
    if self.speed == 0
      self.car += 1 
    else
      puts "car didnt added"
    end
    show_cars_count
  end

  def remove_car
    if self.speed == 0 && self.car > 0
      self.car -= 1 
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
end


statin1= Station.new("qwe")
statin2= Station.new("qwe1")
route1 = Route.new(statin1,statin2)
train = Train.new("qwe","cargo",3)
train.route=route1
train.show_next_station
statin3= Station.new("qwe3")
route1.add_station(statin3)
train.show_next_station