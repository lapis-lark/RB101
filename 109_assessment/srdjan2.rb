# variable shadowing
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b

=begin
local var a is assigned to the Integer 4 on line 1, and local var b is assigned Integer 2 on line 2.
on line 4, Integer method #times is called on Integer 2 with a do..end block accepting one parameter, a.
This block spans lines 4-7, creating an inner scope. local variable a from the outer scope is overshadowed by the block parameter a, making it inaccesible within the block
the block parameter local variable a is reassigned to Integer 5, then passed as an argument to #puts on the next line.
on line 9, original local variable a is accessible once again in the outer scope.
Thus, the output of this program is 5,5,4,2.
=end

# each
[1, 2, 3, 4].each { |num| puts num }
=begin
  Array#each iterates across each element of the calling array, passing each element to the block in the block parameter num
  within the block, each element of the array is passed as an argument to #puts which prints the element to the screen
  the return value of the block is not used, and the return value of #each is the calling array.
=end

# map
[1, 2, 3, 4].map { |num| puts num }
=begin
  Array#map iterates across each element of the calling array, passing them one by one into the block parameter num of the block #map is called with
  within the array, each element is passed as an argument to #puts, outputting the element to the screen.
  the return value of #puts is nil, and #map replaces each element in the array with the return value of the block. thus, the return value is [nil,nil,nil,nil]
=end

# select
[1, 2, 3, 4].select { |num| puts num }
=begin
  Array#select iterates across each element of the array, passing each element as an argument
  into the block #select is called as the block parameter 'num'. inside the block, 
  each element is output to the screen when passed to #puts as an argument.
  #select returns an array of each element which, when passed to the block,
  the block evaluates to true. because #puts always returns nil and nil evalutates to false,
  #select will return an empty array in this case. 
=end

