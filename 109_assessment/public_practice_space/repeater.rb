def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

repeater('Hello')
=begin
  On lines 1-7, method #repeater is defined, which accepts one parameter.
  on line 2, local var result is assigned to the String ''.
  On line 3, local var string calls #each_char with a do..end block accepting one parameter, char.
  Each character from local var string is passed into the block as local var char. 
  On line 4, local variable result has char concatenated onto it 2 times.
  On line 6, local variable result is returned.
  The invocation of #repeater on line 9 with 'Hello' passed in as an argument returns 'HHeelllloo'.
=end

# the array method #each is invoked
# Array#each is invoked
# #each is invoked
