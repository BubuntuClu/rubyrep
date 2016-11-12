class Station

  attr_reader :name
  attr_accessor :next, :prev

  def initialize(name)
    @name = name
    @trains = []
  end
 
  def add_train(train)
    @trains.push(train)
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

  def start_train_to_next_station(train)
    if @trains.include?(train)
      if self.next != nil
        puts "train #{train.number} has left the station #{self.name}"
        @trains.delete_at(@trains.index(train))    
        self.next.add_train(train)
        return true
      else
        puts "its last station"
        return false
      end
    end
  end

  def start_train_to_prev_station(train)
    if @trains.include?(train)
      if self.prev != nil
        puts "train #{train.number} has left the station #{self.name}"
        @trains.delete_at(@trains.index(train)) 
        self.prev.add_train(train)
        return true
      else
        puts "its first station"
        return false
      end
    end
  end

  def trains_count
    @trains.size
  end

end

class Route
  
  attr_reader :start_station
  def initialize(start_station, end_station)
    @start_station = start_station
    @start_station.next = end_station
    @end_station = end_station 
    @end_station.prev = start_station
    @stations = []
  end

  def add_station(station)
    if @stations.size == 0
      @start_station.next = station 
      station.prev = @start_station
    else
      @stations[-1].next = station
      station.prev = @stations[-1]
    end
    station.next = @end_station
    @end_station.prev = station
    @stations.push(station)
  end

  def remove_station(station)
    if station.trains_count == 0
      @stations.each_with_index  do |st, i| 
        if st == station
          station.prev.next = station.next
          station.next.prev = station.prev
          @stations.delete_at(i) 
        end
      end
    else
      puts "there are some trains on the station. u cant delete it"
    end
  end

  def show_stations
    puts "first station is - #{@start_station.name} "
    @stations.each { |station| puts "next station is - #{station.name}" }
    puts "last station is - #{@end_station.name} "
  end
end

class Train

  attr_accessor :speed, :car, :current_station
  attr_reader :route, :number, :type

  def initialize(number, type, car)
    @number = number
    @type = type 
    @car = car
    @speed = 0  
  end

  def route=(route)
    @route = route
    @current_station = route.start_station
    route.start_station.add_train(self)
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

  def move_to_next_station
    isMoved = self.current_station.start_train_to_next_station(self)
    self.current_station = self.current_station.next if isMoved
  end

  def move_to_prev_station
    isMoved = self.current_station.start_train_to_prev_station(self)
    self.current_station = self.current_station.prev if isMoved
  end

  def show_stations
    puts "prev station: #{self.current_station.prev.name}" if self.current_station.prev != nil
    puts "current station: #{self.current_station.name}"
    puts "next station: #{self.current_station.next.name}" if self.current_station.next != nil
  end

  def show_train_info
    puts "number - #{number}; type - #{type}; cars count: #{car}"
  end
end


# station1 = Station.new("st1")
# station1.name
# station1.show_all_trains
# station1.show_typed_trains('cargo')
# station1.show_typed_trains('passenger')

# station10 = Station.new("st10")

# route = Route.new(station1, station10)
# route.show_stations

# station2 = Station.new("st2")
# station3 = Station.new("st3")
# station4 = Station.new("st4")
# route.add_station(station2)
# route.add_station(station3)
# route.add_station(station4)
# route.show_stations
# route.remove_station(station3)
# route.show_stations


# train1 = Train.new("tr1","cargo", 3)
# train1.current_speed
# train1.show_cars_count
# train1.speed_up(99)
# train1.add_car
# train1.show_cars_count
# train1.current_speed
# train1.stop
# train1.current_speed
# train1.add_car
# train1.add_car
# train1.show_cars_count
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.remove_car
# train1.show_cars_count
# train1.speed_up(99)
# train1.add_car
# train1.show_cars_count

# train1.route=route
# train1.route.show_stations


train1 = Train.new("tr1","cargo", 3)
station1 = Station.new("st1")
station10 = Station.new("st10")
route = Route.new(station1, station10)
train1.route = route
train1.move_to_next_station
train1.move_to_next_station
# station1.start_train_to_next_station(train1)
# station10.start_train_to_next_station(train1)

station2 = Station.new("st2")
station3 = Station.new("st3")
station4 = Station.new("st4")
route.add_station(station2)
train1.move_to_prev_station
route.remove_station(station2)
train1.show_stations
station2.show_all_trains
station2.show_typed_trains("cargo")

train2 = Train.new("tr2","passenger", 5)
route2 = Route.new(station2, station3)
train2.route = route2
station2.show_all_trains
station2.show_typed_trains("cargo")
station2.show_typed_trains("passenger")