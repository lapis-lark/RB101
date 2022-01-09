def prompt(str)
  puts ">> #{str}" 
end

nums = []
prompt('first num?')
nums << gets.to_i

prompt('second num?')
nums << gets.to_i

=begin
prompt("#{num1} + #{num2} = #{num1 + num2}")
prompt("#{num1} - #{num2} = #{num1 - num2}")
prompt("#{num1} * #{num2} = #{num1 * num2}")
prompt("#{num1} / #{num2} = #{num1 / num2}")
prompt("#{num1} % #{num2} = #{num1 % num2}")
prompt("#{num1} ** #{num2} = #{num1 ** num2}")
=end

# concise
operations = [:+, :-, :*, :/, :%, :**]

operations.each do |op|
  prompt("#{nums[0]} #{op} #{nums[1]} = #{nums.inject(op)}")
end