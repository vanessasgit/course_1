# 1. Create a class called MyCar. When you initialize a new instance or object of 
# the class, allow the user to define some instance variables that tell us the year, 
# color, and model of the car. Create an instance variable that is set to 0 during 
# instantiation of the object to track the current speed of the car as well. Create 
# instance methods that allow the car to speed up, brake, and shut the car off.

#

# 2. Add an accessor method to your MyCar class to change and view the color of your car. 
# Then add an accessor method that allows you to view, but not modify, the year of your car.


class MyCar
  attr_accessor :color # view and modify the color
  attr_reader :year # view but not modify the year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up (number)
    @speed += number
    puts "Your current speed is #{number} mph"
  end

  def brake(number)
    @speed -= number
    puts "You pressed the brake and now are going #{number} mph"
  end

  def speed
    puts "Your current speed #{@speed}"
  end

  def shut_off
    @speed = 0
    puts "Time to park!"
  end

  def spray_paint(color)
    self.color = color # use self because the setter method is declared above.
    puts "Your new spray paint color of #{color} is awesome!"
  end

end

honda = MyCar.new(2006, 'blue', 'honda civic')
honda.speed_up(15)
honda.speed
honda.speed_up(12)
honda.speed
honda.brake(15)
honda.speed
honda.brake(12)
honda.shut_off
honda.color = 'red'
puts honda.color
puts honda.year
honda.spray_paint('black')
puts honda.color # you can access the new color this way.
