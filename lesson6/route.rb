require_relative 'modules/validator'
require_relative 'station'

class Route
  include Validator
  attr_reader :start_station, :end_station, :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station 
    validate!
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

  private
  def validate!
    raise "NOT VALID STATION1"  unless @start_station.instance_of?(Station)
    raise "NOT VALID STATION2!" unless @end_station.instance_of?(Station)
    true
  end
end