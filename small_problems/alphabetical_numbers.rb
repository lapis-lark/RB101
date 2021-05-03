=begin
NAMES = %w(zero one two three four five six seven eight nine
           ten eleven twelve thirteen fourteen fifteen sixteen
           seventeen eighteen nineteen)

def alphabetic_number_sort(num_arr)
  num_arr.map { |n| NAMES[n]}.sort.map { |n| NAMES.index(n)}
end

def alphabetic_number_sort(num_arr)
  num_arr.sort_by {|n| NAMES[n]}
end

p alphabetic_number_sort((0..19).to_a.reverse) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

NUMBERS_AS_WORDS = %w(zero one two three four five six seven eight nine ten
                      eleven twelve thirteen fourteen fifteen sixteen
                      seventeen eighteen nineteen)

def alphabetic_number_sort(array)
  NUMBERS_AS_WORDS.zip(array).sort.to_h.values
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
