OPERATIONS = { 'add' => '+', 'sub' => '-', 'mult' => '*', 'div' => '/' }

def prompt(str)
  puts "~~> #{str}"
end

def valid_num
  loop do
    num = gets.chomp
    break num.to_f if num.to_f.to_s == num
    prompt('invalid, try again: ')
  end
end

prompt('first num:')
num1 = valid_num
prompt('second num: ')
num2 = valid_num
prompt('operation: ')
op = gets.chomp

result = num1.public_send(OPERATIONS[op], num2)

prompt("#{num1} #{OPERATIONS[op]} #{num2} = #{result}")
