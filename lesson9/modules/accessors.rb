module Accessors
  def attr_accessor_with_history(*args)
    args.each do |arg|
      define_method(arg.to_s) do
        instance_variable_get("@#{arg}")
      end

      define_method("#{arg}=") do |val|
        instance_variable_set("@#{arg}", val)
        a_h = "@#{arg}_history"
        instance_variable_set(a_h, []) unless instance_variable_defined?(a_h)
        instance_variable_get(a_h).push(val)
      end

      define_method("#{arg}_history") do
        instance_variable_get("@#{arg}_history")
      end
    end
  end

  def strong_attr_accessor(name, class_name)
    define_method(name.to_s) do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |val|
      if val.class == class_name
        instance_variable_set("@#{name}", val)
      else
        raise 'not valid type'
      end
    end
  end
end

class Test
  extend Accessors

  attr_accessor_with_history :a, :b
  strong_attr_accessor :c, String
  attr_accessor :name, :number, :station
end

t = Test.new
t.name = 123
t.number = 'A'
