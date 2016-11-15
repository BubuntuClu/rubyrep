require_relative 'modules/manufacturer'
class Car
  include Manufacturer
  attr_accessor :type
  
  def initialize(type)
    @type = type
  end
end