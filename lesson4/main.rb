require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'car'
require_relative 'cargo_car'
require_relative 'passenger_car'



trains = []
stations = []
loop do
  puts "What u want to do?"
  puts "1.create station"
  puts "2.create train"
  puts "3.add car to train"
  puts "4.remove car from train"
  # puts "5.move train to next station"
  puts "6.get list of stations"
  puts "0.exit"

  choise = gets.chomp.to_i
  break if choise == 0

  case choise
  when 1
    puts "enter the name of station:"
    name = gets.chomp.to_s
    st = Station.new(name)
    stations << st

  when 2
    puts "enter the name of train:"
    train_name = gets.chomp.to_s
    puts "choose type of train:"
    puts "1. cargo"
    puts "2. passenger"
    type = gets.chomp.to_i
    if type == 1
      ct = CargoTrain.new(train_name, type)
      trains << ct
    else
      pt = PassengerTrain.new(train_name, type)
      trains << pt
    end

  when 3
    puts "what kind of car do u want to add:"
    puts "1. cargo"
    puts "2. passenger"
    type = gets.chomp.to_i
    if type == 1
      puts "enter the capacity of train:"
      cap = gets.chomp.to_i
      car = CargoCar.new("cargo", cap)
    else
      puts "enter the sleeps of train:"
      sl = gets.chomp.to_i
      car = PassengerCar.new("passenger", sl)
    end
    puts "choose the train, where u want add a car:"
    trains.each_with_index { |train, i| puts "#{i+1}. #{train.number}" }
    n = gets.chomp.to_i
    trains[n-1].add_car(car)
  when 4
    puts "choose the train, from what u want to remove a car:"
    trains.each_with_index { |train, i| puts "#{i+1}. #{train.number}" }
    n = gets.chomp.to_i
    trains[n-1].remove_car
  # when 5
  when 6
    stations.each { |station| puts "#{station.name}"}
  else
    puts" wrong"
  end  
end

