words = {noun: '', verb: '', adjective: '', adverb: ''}

words.each_key do |key|
  puts ">> #{key} please: "
  words[key] = gets.chomp
end

puts "The #{words[:noun]} likes to #{words[:verb]} "\
"#{words[:adverb]} in the #{words[:adjective]} moonlight."