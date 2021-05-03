puts 'bill?'
bill = gets.to_f
puts 'tip percent?'
percent = gets.to_f

tip = (bill * percent / 100).round(2)
total = (bill + tip).round(2)

puts "tip = $#{tip}"
puts "total = $#{total}"
