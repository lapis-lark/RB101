numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
#what's the output
=begin #1
numbers is not modified because .uniq doesn't modify caller;
.uniq! does.

since puts calls to_s on numbers, output is
1
2
2
3
=end

