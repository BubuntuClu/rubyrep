module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  $counter = 0;
  module ClassMethods
    
    def instances
        puts $counter
    end
  end

  module InstanceMethods
    private
    def self.register_instance
      $counter = $counter+1
    end
  end
end