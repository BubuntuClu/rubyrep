require_relative 'modules/validator'

class Station
  include Validator
  attr_reader :trains
  attr_accessor :name
  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
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

  protected
  def validate!
    raise "NOT VALID NAME!" if @name !~ /\w+/i
    true
  end

end