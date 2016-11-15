module Manufacturer
  public
  def show_manufacturer
    self.manufacturer
  end

  def set_m(name)
    self.manufacturer = name
  end

  protected
  attr_accessor :manufacturer
end

class Qwe
  include Manufacturer
  def te
  end
end


q = Qwe.new
q.set_m("sgsgf")
puts "#{q.show_manufacturer}"