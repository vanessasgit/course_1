# 1 Add a class method to your MyCar class that calculates the gas mileage of any car.

# Override the to_s method to create a user friendly print out of your object. 



class MyCar
  attr_accessor :color # view and modify the color
  attr_reader :year # view but not modify the year

  def self.gas_mileage(gallons, miles)
   puts "The gas mileage is #{miles / gallons} mpg"
  end

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

  def to_s
    "The year of the car is #{self.year}, the color is #{self.color} and the model is #{@model}."
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
MyCar.gas_mileage(12, 350)
vw = MyCar.new(2011, 'violet', 'VW Passat')
puts vw


# 3. When running the following code...

#class Person
#  attr_reader :name
#  def initialize(name)
#    @name = name
#  end
#end

#bob = Person.new("Steve")
#bob.name = "Bob"

# We get the following error...

# test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

#Answer we need to change attr_reader to attr_accessor or attr_writer to change it 
# from the getter method to a setter method.
