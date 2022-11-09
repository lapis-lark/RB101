# PROBLEM: 
# find the contiguous subsequence that has the greatest sum

# Examples:
# max_sequence([3,-2,4]) -> 5
# max_sequence([-1, 4,-5,4,5]) -> 9
# max_sequence([]) -> 0 (empty arrays valid, return 0)

# input: array of integers, positive or negative
# output: integer, largest sum possible made of a contiguous subsequence

# algorithm: 
# add all contiguous subsequences to a new array
# find the sum of each array, return the largest sum
require 'byebug'
=begin 
def max_sequence(arr)
  subsequences = []
  return 0 if arr.empty?
  
  0.upto(arr.size - 2) do |left|
    (left + 1).upto(arr.size - 1) do |right|
      subsequences << arr[left..right]
    end
  end
  byebug
  ans = subsequences.map(&:sum).sort[-1]
  ans < 0 ? 0 : ans
end
=end

def max_sequence(arr)
  subsequences = []

  arr.size.times do |left|
    -1.downto(-(arr.size - 1)) do |right|
      subsequences << arr[left..right]
    end
  end

  byebug

  ans = subsequences.map(&:sum).sort[-1]
  ans < 0 ? 0 : ans
end

def max_sequence(arr)
  subsequences = []
  return 0 if arr.size == 0

  size = arr.size
  size.times do
    size.times do |i|
      subsequences << arr[0..i]
    end
  arr.shift
  end

  ans = subsequences.map(&:sum).sort[-1]
  ans < 0 ? 0 : ans
end

def max_sequence(arr)
  subsequences = []
  return 0 if arr.size == 0

  size = arr.size
  size.times do |left|
    (left..(size - 1)).each do |right|
      subsequences << arr[left..right]
    end
  end
  byebug
  ans = subsequences.map(&:sum).sort[-1]
  ans < 0 ? 0 : ans
end

# p max_sequence([])
p max_sequence([-2,1,-3,4,-1,2,1,-5,4])
p max_sequence([11])
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4])
p max_sequence([-32])
