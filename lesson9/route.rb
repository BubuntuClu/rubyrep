require_relative 'modules/validator'
require_relative 'station'

class Route
  include Validations
  attr_reader :start_station, :end_station, :stations

  validate :start_station, :type, Station
  validate :end_station, :type, Station
  
  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    if valid?
      @stations = [start_station, end_station] 
    end
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    if station.trains_count.zero?
      stations.delete(station)
    else
      puts 'there are some trains on the station. u cant delete it'
    end
  end

  def show_stations
    puts "first station is - #{@start_station.name} "
    stations.each { |station| puts "next station is - #{station.name}" }
    puts "last station is - #{@end_station.name} "
  end
end

r=Route.new(1,2)
