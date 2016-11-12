class Car
  def start_engine
    puts "3 6 9"
  end

  def beep
    puts " beep beep tvoi signalit jeep"
  end

  def stop

    @speed = 0
  end

  def go
    speed = 40
    @speed = 50
    puts " local speed: #{speed}, inst speed #{@speed}"
  end

  def current_speed
    puts "current speed #{@speed}, local speed #{speed}"
  end
end
