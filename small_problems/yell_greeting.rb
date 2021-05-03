print "What's your name? "
name = gets.chomp
if name.end_with?('!')
  puts "hello, #{name.chop}. why are we screaming?".upcase
else
  puts "Hello, #{name}."
end
