class Menu
  def initialize
    self.stations = []
    self.trains = []
    self.routes = []
  end

  def main_menu
    loop do
      puts 'What u want to do?'
      puts '1.create station'
      puts '2.create train'
      puts '3.add car to train'
      puts '4.remove car from train'
      puts '5.create route'
      puts '6.add stations to roaf'
      puts '7.set route to train'
      puts '8.move train to next station'
      puts '9.get list of stations and trains'
      puts '10.show all detailed info of cars in train'
      puts '11.show all detailed info of trains at station'
      puts '0.exit'

      choise = gets.chomp.to_i
      break if choise.zero?

      case choise
      when 1
        add_station
      when 2
        add_train
      when 3
        add_car
      when 4
        remove_car
      when 5
        create_route
      when 6
        add_station_to_route
      when 7
        set_route_to_train
      when 8
        move_train
      when 9
        show_stations_and_trains
      when 10
        show_cars_of_train
      when 11
        show_trains_at_station
      else
        puts' wrong'
      end
    end
  end

  private

  attr_accessor :stations, :trains, :routes
  def add_station
    puts 'enter the name of station:'
    name = gets.chomp.to_s
    st = Station.new(name)
    stations << st
  end

  def add_train
    puts 'enter the name of train:'
    train_name = gets.chomp.to_s
    puts 'choose type of train:'
    puts '1. cargo'
    puts '2. passenger'
    type = gets.chomp.to_i
    if type == 1
      ct = CargoTrain.new(train_name, 'cargo')
      trains << ct
    else
      pt = PassengerTrain.new(train_name, 'passenger')
      trains << pt
    end
    puts "the train #{train_name} was created.WOOHOO!"
  rescue StandardError => e
    puts "error: #{e.message}"
    retry
  end

  def add_car
    puts 'what kind of car do u want to add:'
    puts '1. cargo'
    puts '2. passenger'
    type = gets.chomp.to_i
    if type == 1
      puts 'enter the capacity of train:'
      cap = gets.chomp.to_i
      car = CargoCar.new('cargo', cap)
    else
      puts 'enter the sleeps of train:'
      sl = gets.chomp.to_i
      car = PassengerCar.new('passenger', sl)
    end
    trains[choose_the_train - 1].add_car(car)
  end

  def remove_car
    trains[choose_the_train - 1].remove_car
  end

  def show_stations_and_trains
    stations.each do |station|
      puts "station name: #{station.name}"
      station.trains.each { |train| puts "train name: #{train.number}" }
    end
  end

  def create_route
    puts 'set the start point of route:'
    start_station = stations[choose_the_station - 1]
    puts 'set the end point of route:'
    end_station = stations[choose_the_station - 1]
    routes << Route.new(start_station, end_station)
  end

  def add_station_to_route
    route = routes[choose_the_route - 1]
    puts 'choose what station to add:'
    route.add_station(stations[choose_the_station - 1])
  end

  def set_route_to_train
    route = routes[choose_the_route - 1]
    train = trains[choose_the_train - 1]
    train.route = route
  end

  def move_train
    train = trains[choose_the_train - 1]
    train.move_train
  end

  def show_cars_of_train
    train = trains[choose_the_train - 1]
    train.show_all_cars_block do |car, i|
      puts "#{i + 1}: #{car.type};#{car.show_free_space};#{car.hold_place}"
    end
  end

  def show_trains_at_station
    puts 'choose the station, that should show the info about trains:'
    stations[choose_the_station - 1].show_all_train_block do |train|
      puts train.show_train_info.to_s
    end
  end

  def choose_the_train
    puts 'choose the train:'
    trains.each_with_index { |train, i| puts "#{i + 1}. #{train.number}" }
    gets.chomp.to_i
  end

  def choose_the_route
    puts 'choose the route:'
    routes.each_with_index { |_route, i| puts "#{i + 1}. " }
    gets.chomp.to_i
  end

  def choose_the_station
    stations.each_with_index { |station, i| puts "#{i + 1}. #{station.name}" }
    gets.chomp.to_i
  end
end
