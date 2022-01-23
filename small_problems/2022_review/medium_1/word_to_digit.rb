def word_to_digit(text)
  text.split.map do |word|
    case word
    when /one/ then word.gsub(/one/, '1')
    when /two/ then word.gsub(/two/, '2')
    when /three/ then word.gsub(/three/, '3')
    when /four/ then word.gsub(/four/, '4')
    when /five/ then word.gsub(/five/, '5')
    when /six/ then word.gsub(/six/, '6')
    when /seven/ then word.gsub(/seven/, '7')
    when /eight/ then word.gsub(/eight/, '8')
    when /nine/ then word.gsub(/nine/, '9')
    when /zero/ then word.gsub(/zero/, '0')
    else word
    end
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'