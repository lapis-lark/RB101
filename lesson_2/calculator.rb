OPERATIONS = %w[add subtract multiply divide]

def valid_num?(num)
  if num.empty? == false && num.scan(/\D/).empty?
    true
  else
    false
  end
end

def get_int
  loop do
    int = gets.chomp
    if valid_num?(int)
      break int.to_i
    else
      puts 'Not a valid number. Try again.'
    end
  end
end

def get_op
  operation = gets.chomp.downcase
  until OPERATIONS.include?(operation)
    puts "Valid operations are add, subtract, divide, and multiply. Try again."
    operation = gets.chomp.downcase
  end

  operation
end

def calculator(a, b, operation)
  case operation
  when 'add'
    a + b
  when 'subtract'
    a - b
  when 'multiply'
    a * b
  when 'divide'
    if b == 0
      puts "Don't try to divide by zero, silly."
    else
      a / b
    end
  end
end

continue = true
while continue
  puts '>>First number, please!'
  a = get_int
  puts '>>Second number, please!'
  b = get_int
  puts '>>Operation, please!'
  operation = get_op
  puts calculator(a, b, operation)
  loop do
    puts '>>Perform more mathematical operations? (y/n)'
    ans = gets.chomp.downcase
    case ans
    when 'y'
      break
    when 'n'
      continue = false
      break
    else
      puts 'Sorry, answer with y/n only please.'
    end
  end
end
