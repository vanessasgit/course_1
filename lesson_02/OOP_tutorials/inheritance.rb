# 1. Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior 
# that isn't specific to the MyCar class to the superclass. Create a constant in your MyCar class 
# that stores information about the vehicle that makes it different from other types of Vehicles.

#Then create a new class called MyTruck that inherits from your superclass that also has a constant
# defined that separates it from the MyCar class in some way.

# 2. Add a class variable to your superclass that can keep track of the number of objects created that inherit 
# from the superclass. Create a method to print out the value of this class variable as well.

#3 Create a module that you can mix in to ONE of your subclasses that describes a behavior unique 
# to that subclass.

#4 Print to the screen your method lookup for the classes that you have created.

#5 Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. 
# Make sure that all of your previous method calls are working when you are finished.

#6Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the
# private method is not available from outside of the class. You'll need to use Ruby's built-in 
# Time class to help.

module Towable
  def tow
    "This vehicle can tow a boat"
  end
end

class Vehicle
  @@number_of_objects = 0

  attr_accessor :color # view and modify the color
  attr_reader :year # view but not modify the year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_objects += 1
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

  def self.gas_mileage(gallons, miles)
   puts "The gas mileage is #{miles / gallons} mpg"
  end

  def self.number_of_objects
    puts "This program has created #{@@number_of_objects} objects"
  end

  def age
    "Your car is #{calculate_age}."
  end

  private

  def calculate_age
    Time.now.year - self.year
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  def to_s
    "The year of the truck is #{self.year}, the color is #{self.color} and the model is #{@model}."
  end

  include Towable

end



class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "The year of the car is #{self.year}, the color is #{self.color} and the model is #{@model}."
  end
end

honda = MyCar.new(2006, 'blue', 'Honda Civic')
chevy = MyTruck.new(1998, 'red', 'Chevy Silverado')

puts honda
puts chevy

puts chevy.tow
puts Vehicle.ancestors
puts "---------"
puts MyCar.ancestors
puts "---------"
puts MyTruck.ancestors
puts "---------"

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
puts honda.color
puts honda.age
puts chevy.age