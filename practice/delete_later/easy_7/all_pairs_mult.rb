require 'byebug'

def multiply_all_pairs(arr1, arr2)
  multiples = []
  arr1.each do |n1|
    multiples << (arr2.map { |n2| n1 * n2 })
  end

  multiples.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]