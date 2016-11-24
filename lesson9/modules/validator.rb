module Validations
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :val_hash
    def validate(name, attr, *args)
      self.val_hash ||= {}
      val_hash[name] ||= []
      self.val_hash[name].push([attr, args[0]])
    end

    private

    attr_writer :val_hash
  end

  module InstanceMethods
    def valid?
      validate!
    rescue StandardError => e
      puts e.message.to_s
      false
    end

    def validate!
      temp_hash = self.class.val_hash
      temp_hash.each do |attr_name, attr_args|
        attr_args.each { |args| send(args[0], instance_variable_get("@#{attr_name}"), args[1]) }
      end
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
