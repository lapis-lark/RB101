# input: array of lowercase strings
# output: array of each letter that is present in each string (with duplicates)
# data: array of strings
# algo: 
  # for each letter in first string of array, testif in all other strings
  # if so, add to array of shared letters
  # delete that instance of the letter in each string
require 'byebug'

def common_chars(arr)
  new_arr = arr.map(&:dup)

  shared = []

  new_arr[0].chars.each do |c|
    (shared << c) if new_arr[1..-1].all? do |word|
      word.include?(c)
    end
    new_arr[1..-1].each { |word| word.sub!(c, '') }
  end
  p arr
  shared
end

p common_chars(['bella', 'label', 'roller'])