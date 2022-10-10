def madlibs
  speech_parts = {noun: '', verb: '', adjective: nil, adverb: nil}
  speech_parts.keys.each do |part|
    puts "insert a #{part}"
    speech_parts[part] = gets.chomp
  end

  puts "Do you like #{speech_parts[:adjective]} #{speech_parts[:noun]}?"
  puts "Me too! Let's celebrate by trying to #{speech_parts[:verb]} #{speech_parts[:adverb]}!"
end

madlibs