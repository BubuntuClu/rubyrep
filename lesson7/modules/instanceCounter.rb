module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      self.counter
    end
  
    protected
    attr_accessor :counter  
    def add
      # i didnt change that in first time because i want to hear about it in next lesson
      self.counter ||= 0
      self.counter += 1
    end
  end

  module InstanceMethods
    private
    def register_instance
      self.class.send(:add)
    end
  end
end