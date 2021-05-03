OPERATIONS = %w(+ - / * % **)

def prompt(message)
  puts "==> #{message}"
end

prompt 'Enter the first number:'
num1 = gets.to_i
prompt 'Enter the second number:'
num2 = gets.to_i

OPERATIONS.each do |op|
  result = num1.send(op.to_sym, num2)
  prompt "#{num1} #{op} #{num2} = #{result}"
end
