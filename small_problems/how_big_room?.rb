puts 'length of room in meters:'
length = gets.to_f
puts 'width of room in meters'
width = gets.to_f
area = length * width
area_feet = area * 3.28**2
puts "The area of the room is #{area} square meters (#{area_feet.round(2)} square feet.)"