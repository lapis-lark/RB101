puts "well hello there! what's your name?"
name = gets.chomp

if name[-1] == '!'
  name = name[0...-1] # or .chop
  puts "HOWDY #{name.upcase}! WHY ARE WE SCREAMING?!"
else
  puts "howdy #{name}!"
endc