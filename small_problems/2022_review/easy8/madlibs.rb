words = {noun: '', adjective: '', verb: '', adverb: ''}

words.each do |k, _|
  puts "input a #{k}: "
  words[k] = gets.chomp
end

puts "Do you #{words[:verb]} your #{words[:adjecte]} #{words[:noun]} #{words[:adverb]}?"