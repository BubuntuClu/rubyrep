module Manufacturer
  public
  def show_manufacturer
    puts "the manufacturer is #{self.manufacturer}"
  end

  def set_m(name)
    self.manufacturer = name
  end

  protected
  attr_accessor :manufacturer
end