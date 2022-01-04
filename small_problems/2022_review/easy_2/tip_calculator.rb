puts 'bill total?'
bill = gets.to_f

puts 'tip percent?'
tip_percent = gets.to_f * 0.01

tip = (bill * tip_percent).round(2)
total = bill + tip

puts "the tip is $#{sprintf("%.2f", tip)}"
puts "the total is $#{sprintf("%.2f", total)}"