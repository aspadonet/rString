#puts "Hello, World!"

fName = "one"
lName = "two"
puts fName + " " + lName
fullName = fName + " " + lName
puts "my first name is #{fName} and #{lName}"
puts fName.class
puts fName.length
puts fName.reverse
puts fName.capitalize
puts fName.empty?
puts fullName.sub("two","thrie")
puts fullName.methods
newFName = fName
fName = "John"
puts newFName
puts fName
puts tSting = "the new first name is #{newFName} \#{newFName}"
puts "what is your first name?"
myFirstName = gets.chop
puts myFirstName 
puts 7 + 8