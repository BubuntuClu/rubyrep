require_relative 'modules/manufacturer'
require_relative 'modules/instance_counter'
require_relative 'modules/validator'

class Car
  include Manufacturer
  include InstanceCounter
  include Validations

  TYPE_FORMAT = /^(cargo|passenger)$/i
  attr_accessor :type
  validate :type, :format, TYPE_FORMAT
  def initialize(type)
    @type = type
    validate!
    register_instance
  end
end

# t = Car.new('cargo')
# puts t.valid?
# t.type = 1
# puts t.valid?
