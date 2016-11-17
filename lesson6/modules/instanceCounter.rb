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
      self.counter = 0 if self.counter == nil
      self.counter = self.counter + 1
    end
  end

  module InstanceMethods
    private
    def register_instance
      self.class.send(:add)
    end
  end
end