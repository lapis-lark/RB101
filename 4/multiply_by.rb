my_numbers = [1, 4, 3, 7, 2, 6]


def multiply nums, mult
  mult_nums = []
  i = 0
  while i < nums.size
    mult_nums << (nums[i] * mult)
    i += 1
  end
  mult_nums
end




p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]