module Validations
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@val_hash = {}
    def validate(name, attr, *args)
      @@val_hash[name.to_sym] = [attr, args[0]]      
    end

    define_method(:@@val_hash) do
      @@val_hash
    end
  end

  module InstanceMethods
    def valid?
      validate!
      rescue StandardError => e
        puts "#{e.message}"
        false
    end
    
    def validate!
      temp_hash = self.class.send(:@@val_hash)
      temp_hash.each do |k,v|
        presence(k) if v[0].to_s == "presence"
        format(k,v[1]) if v[0].to_s == "format"
        type(k,v[1]) if v[0].to_s == "type"
      end
      true    
    end

    protected

    def presence(attr_name)
      raise "Field is not presence!" if instance_variable_get("@#{attr_name}").to_s.empty?
    end

    def format(attr_name, reg)
      raise 'Field is not in format' if instance_variable_get("@#{attr_name}").to_s !~ reg
    end

    def type(attr_name,class_name)
      raise 'Field is not needed type'  unless instance_variable_get("@#{attr_name}").instance_of?(class_name)
    end
  end
end