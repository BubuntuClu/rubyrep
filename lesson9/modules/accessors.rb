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

  attr_accessor_with_history :a, :b
  strong_attr_accessor :c, String
end


