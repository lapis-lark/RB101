def prompt(str)
  puts ">> #{str}" 
end

nums = []
operations = [:+, :-, :*, :/, :%, :**]

prompt('first num?')
nums << gets.to_i
prompt('second num?')
nums << gets.to_i

operations.each do |op|
  prompt("#{nums[0]} #{op} #{nums[1]} = #{nums.inject(op)}")
end