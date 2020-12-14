flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p (flintstones.each_with_index do |name, index|
  break index if name.start_with?('Be')
end)

p flintstones.index {|name| name[0,2] == 'Be'}