module Accessors
  def attr_accessor_with_history(*args)
    args.each do |arg|
      define_method("#{arg}") do
        if instance_variable_defined?("@#{arg}")
          instance_variable_get("@#{arg}")
        else
          instance_variable_set("@#{arg}_history",[])
          instance_variable_set("@#{arg}",0)
        end
      end

      define_method("#{arg}=") do |val|
        instance_variable_set("@#{arg}",val)
        eval "@#{arg}_history+=[#{val}]"
      end

      define_method("#{arg}_history") do
        instance_variable_get("@#{arg}_history")
      end
    end
  end

  def strong_attr_accessor(name,class_name)
    define_method("#{name}") do
      if instance_variable_defined?("@#{name}")
        instance_variable_get("@#{name}")
      else
        instance_variable_set("@#{name}",0)
      end
    end

    define_method("#{name}=") do |val|
      if val.class.to_s == class_name.to_s
        instance_variable_set("@#{name}",val)
      else
        raise "not valid type"
      end
    end
  end
end




class Test
  extend Accessors
  include Validations

  attr_accessor_with_history :a, :b
  strong_attr_accessor :c, String
  attr_accessor :name, :number, :station

  validate :name, :presence
  validate :number, :format, /A{1,3}/
  validate :station, :type, String
end

t=Test.new
t.name=123
t.number="A"
t.station = "asd"
t.valid?

# t.validate!
# t.number="A"
# t.validate!
# t2=Test.new
# puts t.a
# puts t.a=3
# puts t.a=4
# puts "#{t.a_history}"
# puts t.b
# puts t.b=5
# puts t.b=6
# puts "#{t.b_history}"
# puts t2.a
# puts t2.a=1
# puts t2.a=0
# puts "#{t2.a_history}"
# puts t2.b
# puts t2.b=9
# puts t2.b=8
# puts "#{t2.b_history}"