puts "well hello there! what's your name?"
name = gets.chomp

if name[-1] == '!'
  name = name[0...-1]
  puts "HOWDY #{name.upcase}! WHY ARE WE SCREAMING?!"
else
  puts "howdy #{name}!"
end