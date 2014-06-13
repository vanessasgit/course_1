# Play around with variable scope and test out different scenarios.

# 1 Create a local variable and modify it at an inner scope. You can try

#    a) re-assigning the variable to something else
#    b) call a method that doesn’t mutate the caller
#    c) call a method that mutates the caller.

# 2 Create a local variable at an inner scope and try to reference it in 
# the outer scope. What happens when you have nested do/end blocks? 




# 1. a) re-assigning the variable to something else
x = 25
p "Original variable is: #{x}"

5.times do |v|
  x = 30
end

puts "x reassigned is #{x}"

#1 b) call a method that doesn’t mutate the caller

x = 25
p "Original variable is: #{x}"

def no_mutate(number)
  number = 30
end

no_mutate(x)
puts "This method doesn't mutate x:  #{x}"



#1 c) call a method that mutates the caller.
y = [4, 5, 6]

p "Original variable = #{y}"

def mutate(arr)
  arr.pop
end

mutate(y)
p "Here is the mutated variable: #{y}"

# 2 Create a local variable at an inner scope and try to reference it in 
# the outer scope. What happens when you have nested do/end blocks? 

m = 50

2.times do |number|
  m = 2
  b = 10
end

puts m
puts b

# returns the following error:  undefined local variable or method `b' for main:Object (NameError)


# nested 

n = 34

2.times do |number|
  n = 2
  b = 10
  2.times do |nested|
    v = 2
  end
end

puts v


#returns the following error
# undefined local variable or method `v' for main:Object (NameError)






