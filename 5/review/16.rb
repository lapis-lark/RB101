def uuid
  valid_chars = ('a'..'z').to_a + ('0'..'9').to_a
  id = ''
  32.times { id << valid_chars.sample }
  puts "#{id[0...8]}-#{id[8...12]}-#{id[12...16]}-#{id[16...20]}-#{id[20..-1]}"
end

uuid