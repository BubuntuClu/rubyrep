require_relative 'modules/manufacturer'
require_relative 'modules/instance_counter'
require_relative 'modules/validator'

class Train
  include Manufacturer
  include InstanceCounter
  include Validations
  attr_accessor :speed, :number, :type
  attr_reader :route, :cars, :index_station

  NUMBER_FORMAT = /^(\w{3})(-\w{2})?$/
  TYPE_FORMAT = /^(cargo|passenger)$/i

  validate :number, :format, NUMBER_FORMAT
  validate :type, :format, TYPE_FORMAT
  @@trains = {}
  def self.find(number)
    @@trains[number]
  end

  def initialize(number, type)
    @number = number
    @type = type
    validate!
    @speed = 0
    @cars = []
    @@trains[number] = self
    register_instance
  end

  def route=(route)
    @route = route
    @index_station = 0
    @route.stations[index_station].add_train(self)
  end

  def speed_up(speed)
    self.speed = speed if speed > 0
  end

  def current_speed
    puts "current speed: #{speed}"
  end

  def stop
    self.speed = 0
  end

  def add_car(car)
    cars << car
    show_cars_count
  end

  def remove_car
    if speed.zero? && !cars.empty?
      cars.delete_at(-1)
    else
      puts 'car didnt removed'
    end
    show_cars_count
  end

  def move_train
    if index_station == route.stations.size - 1
      self.index_station = 0
      route.stations.reverse!
    end
    current_station = route.stations[index_station]
    current_station.remove_train(self)
    self.index_station += 1
    current_station = route.stations[index_station]
    current_station.add_train(self)
  end

  def show_current_station
    puts "current station: #{route.stations[self.index_station].name}"
  end

  def show_next_station
    if self.index_station == route.stations.size - 1
      puts 'u r in the end of route'
    else
      puts "next station: #{route.stations[self.index_station + 1].name}"
    end
  end

  def show_prev_station
    if self.index_station.zero?
      puts 'u r in the start of route'
    else
      puts "next station: #{route.stations[self.index_station - 1].name}"
    end
  end

  def show_train_info
    puts "number - #{number}; type - #{type}; cars count: #{cars.size}"
  end

  def show_all_cars_block
    @cars.each_with_index { |car, i| yield(car, i) }
  end

  protected

  # put it in protected, because we need to use this method in subclasses
  # and dont let users change that values manualy
  attr_writer :cars, :index_station

  # put it in protected, because we need to use this method in subclasses
  def show_cars_count
    puts "cars count: #{cars.size}"
  end
end

t = Train.new('123', 'cargo')
puts t.valid?
t.number = 1
puts t.valid?
