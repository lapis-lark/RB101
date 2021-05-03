arr = []
suffix = Hash.new('th')
suffix.merge!({ 1 => 'st', 2 => 'nd', 3 => 'rd' })

(1..6).each do |i|
  puts "Enter the #{i.to_s + suffix[i]} number."
  arr << gets.to_i
end

if arr[0, 5].include?(arr[5])
  puts "The number #{arr[5]} appears in #{arr[0, 5]}."
else
  puts "The number #{arr[5]} does not appear in #{arr[0, 5]}."
end
