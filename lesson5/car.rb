require_relative 'modules/manufacturer'
require_relative 'modules/instanceCounter'

class Car
  include Manufacturer
  include InstanceCounter
  attr_accessor :type
  
  def initialize(type)
    @type = type
    register_instance
  end
end