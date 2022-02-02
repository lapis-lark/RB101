def crunch(str)
new_str = ''
str.chars.each { |c| new_str << c unless new_str[-1] == c  }
new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''