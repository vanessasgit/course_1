# Create a method that takes an array as a parameter. Within that method, try 
# calling methods that do not mutate the caller. How does that affect the array 
# outside of the method? What about when you call a method that mutates the 
# caller within the method?


x = [50, 100, 150, 200, 150]

def no_mutate(variable)
  y = variable.uniq
end

p "This is the what the no_mutate method returns"
p no_mutate(x)

p  "This is the original array: #{x}"

# If the method doesn't mutate the caller, the original array outside of the
# method isn't changed.

# If you call a method that mutates the caller within a method it will change
# the array outside of the method

x = [50, 100, 150, 200, 150]

def mutate(variable)
  y = variable.uniq!
end

p "This is the what the mutate method returns"
p mutate(x)

p  "This is the original array: #{x}"



