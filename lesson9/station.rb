require_relative 'modules/validator'

class Station
  include Validations
  attr_reader :trains
  attr_accessor :name
  @@stations = []

  NUMBER_FORMAT = /^(\w{3})(-\w{2})?$/

  validate :name, :presence
  validate :name, :format, NUMBER_FORMAT
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
    puts "station #{name}: train has arrived. count of trains: #{trains_count}"
  end

  def show_all_trains
    puts "the list of trains on #{name} :"
    @trains.each(&:show_train_info)
  end

  def show_all_train_block
    @trains.each { |train| yield(train) }
  end

  def show_typed_trains(type)
    puts "the list of #{type} trains on #{name} :"
    @trains.each { |train| train.show_train_info if train.type == type }
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def trains_count
    @trains.size
  end
end

# uncomment when it will be done wit Route
# st=Station.new("1")
# puts st.valid?
# st.name=""
# puts st.valid?
