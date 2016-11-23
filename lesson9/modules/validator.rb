module Validations
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :val_hash
    def validate(name, attr, *args)
      self.val_hash ||= {}
      self.val_hash[self.val_hash.size + 1] = [name.to_sym, attr, args[0]]
    end

    def get_hash
      self.val_hash
    end
  end

  module InstanceMethods
    def valid?
      validate!
    rescue StandardError => e
      puts e.message.to_s
      false
    end

    def validate!
      temp_hash = self.class.send(:get_hash)
      temp_hash.each { |_, v| send(v[1], instance_variable_get("@#{v[0]}"), v[2]) }
      true
    end

    protected

    def presence(*args)
      raise 'Field is not presence!' if args[0].to_s.empty?
    end

    def format(*args)
      raise 'Field is not in format' if args[0].to_s !~ args[1]
    end

    def type(*args)
      raise 'Field is not in needed type' unless args[0].instance_of?(args[1])
    end
  end
end
