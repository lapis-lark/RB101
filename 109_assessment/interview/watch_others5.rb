# PROBLEM
# find the longest prefix string among an array of strings

# Examples:
  # 'flow', 'flower', 'fan' -> 'f'
  # 'flow', 'flower', 'floor' -> 'flo'

# INPUT -> array of strings
# OUTPUT -> string

# Data -> strings, arrays

# ALGO
  # declare a variable equal to first character of string
  # itereate through array testing if prefex for all
  # if it is, add on next char
  # break out with longest prefix when string doesn't match
  # return the string if break never happens

def common_prefix(arr)
  return '' unless arr.all? { |str| str[0] == arr[0][0] }

  arr[0].size.times do |i|
    prefix = arr[0][0..i]
    arr.each do |str|
      return prefix[0...-1] unless str[0...prefix.size] == prefix 
    end
  end

  arr[0]
end

p common_prefix(['flower', 'flow', 'flight'])
p common_prefix(['dog', 'cat'])
p common_prefix(['interspecies', 'interstellar', 'interstate'])
p common_prefix(['throne', 'throne'])


p common_prefix(%w(cat cate car))
p common_prefix(%w(cook core code))
p common_prefix(%w(semitruck semibalanced semiweird))
p common_prefix(%w(truck truck truck))
p common_prefix(%w(flower flow fliwht))