DIGITS = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3,
          'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7,
          'eight' => 8, 'nine' => 9 }

def word_to_digit(str)
  str.split.map do |word|
    punct = word.delete("a-zA-Z")
    key = word.downcase.delete("^a-z")
    DIGITS.has_key?(key) ? DIGITS[key].to_s + punct : word
    end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'