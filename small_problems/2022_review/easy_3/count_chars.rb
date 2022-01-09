puts "input word or phrase"
text = gets.chomp

puts "there are #{text.delete(' ').size} chars in #{text}."