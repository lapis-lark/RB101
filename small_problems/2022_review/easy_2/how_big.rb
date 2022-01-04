=begin
puts "room length in meters:"
length = gets.to_f
puts "room width in meters:"
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (length * width * 10.7639).round(2)

puts "area in square meters: #{square_meters}"
puts "area in square feet: #{square_feet}"
=end

# further
puts "room length in feet:"
length = gets.to_f
puts "room width in feet:"
width = gets.to_f

square_feet = (length * width).round(2)
square_inches = (length * width * 144).round(2)
square_cent = (length * width * 929.03).round(2)

puts "area in square feet: #{square_feet}"
puts "area in square inches: #{square_inches}"
puts "area in square centimeters: #{square_cent}"