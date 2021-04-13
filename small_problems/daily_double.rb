def crunch(string)
  new_str = ''
  string.chars.each_with_index do |char, i|
    new_str << char unless char == string[i + 1]
  end
  new_str
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''