require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
OPERATIONS = %w[add subtract multiply divide]

def prompt(message)
  puts ">> #{message}"
end

def operator_to_string(operator)
  word = case operator
          when 'add'
            'Adding'
          when 'subtract'
            'Subtracting'
          when 'multiply'
            'Multiplying'
          when 'divide'
            'Dividing'
          end
  word
end

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
      break int.to_f
    else
      prompt 'Not a valid number. Try again.'
    end
  end
end

def get_op
  operation = gets.chomp.downcase
  operation_prompt = <<-MSG
  Valid operations are:
  //add
  //subtract
  //multiply
  //divide
  Please try again:
  MSG
  until OPERATIONS.include?(operation)
    prompt operation_prompt
    operation = gets.chomp.downcase
  end

  operation
end

def calculator(a, b, operation)
  prompt "#{operator_to_string(operation)} the numbers..."
  case operation
  when 'add'
    a + b
  when 'subtract'
    a - b
  when 'multiply'
    a * b
  when 'divide'
    if b == 0
      prompt MESSAGES['jp']['divide_by_zero']
    else
      a / b
    end
  end
end

# body
prompt MESSAGES['jp']['welcome']
name = gets.chomp
loop do
  prompt 'First number, please!'
  a = get_int
  prompt 'Second number, please!'
  b = get_int
  prompt 'Operation, please!'
  operation = get_op
  prompt calculator(a, b, operation)
  loop do
    prompt 'Perform more mathematical operations? (y/n)'
    ans = gets.chomp.downcase
    case ans
    when 'y'
      break
    when 'n'
      prompt "Have a nice day, #{name}!"
      exit
    else
      prompt 'Sorry, answer with y/n only please.'
    end
  end
end
