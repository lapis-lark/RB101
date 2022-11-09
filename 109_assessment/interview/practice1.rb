# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# Examples:

=begin
Problem:
  transform an array of numbers to how many are smaller than it
  only count unique values

Examples: 
  [1,2,3] -> [0,1,2]
  [1,2,2,3] -> [0,1,1,2]

DATA: 
  arrays of integers, integers
INPUT: array of ints
OUTPUT: array of ints

ALGO: 
  loop within loop to iterate over each num and each num in relation to that num
  add num to new array if less than given num and not already in array
  add size of that array to new array of smaller values that will be output
=end

def smaller_numbers_than_current(arr)
  smaller = []

  arr.each do |num|
    temp = []
    arr.each do |less_num|
      (temp << less_num) if (num > less_num && !(temp.include?(less_num)))
    end
    smaller << temp.size
  end

  smaller
end




p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".

