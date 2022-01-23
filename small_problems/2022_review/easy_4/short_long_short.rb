def short_long_short(str1, str2)
  if str1.size > str2.size
    long = str1
    short = str2
  else
    long = str2
    short = str1
  end
  "#{short}#{long}#{short}"
end

def short_long_short(str1, str2)
  str1.size > str2.size ? "#{str2}#{str1}#{str2}" : "#{str1}#{str2}#{str1}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"