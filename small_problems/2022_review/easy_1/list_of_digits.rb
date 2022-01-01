# easiest
def digit_list(num)
  num.digits.reverse
end

# lil more brain power
def digit_list(num)
  list = []
  until num == 0
    list << num % 10
    num /= 10
  end

  list.reverse
end

# using string conversion instead
def digit_list(num)
  num.to_s.chars.map { |digit| digit.to_i } # can be shorthanded to .map(&:to_i)
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true