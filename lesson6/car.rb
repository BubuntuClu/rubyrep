require_relative 'modules/manufacturer'
require_relative 'modules/instanceCounter'
require_relative 'modules/validator'

class Car
  include Manufacturer
  include InstanceCounter
  include Validator
  attr_accessor :type
  
  def initialize(type)
    @type = type
    validate!
    register_instance
  end

  protected
  def validate!
    raise "NOT VALID TYPE!" if type !~ /^(cargo|passenger)$/i
    true
  end
end