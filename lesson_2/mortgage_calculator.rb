require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

def prompt(message)
  puts ">> #{message}"
end

def get_value
  loop do
    value = gets.chomp
    if valid?(value)
      break value.to_f
    else
      prompt 'Input invalid. Please input an integer or a decimal.'
    end
  end
end

def valid?(value)
  if integer?(value) || float?(value)
    true
  else
    false
  end
end

def integer?(value)
  # solve edge case of leading zeroes, e.g. '00123'
  while value[0] == '0'
    value.delete_prefix!('0')
  end
  if value.to_i.to_s == value
    true
  else
    false
  end
end

def float?(value)
  # solve edge case of '1.' returning false
  if value[-1] == '.'
    value.concat('0')
  end
  if value.to_f.to_s == value
    true
  else
    false
  end
end

# body
prompt MESSAGES['welcome']
loop do
  prompt MESSAGES['principal?']
  principal = get_value
  prompt MESSAGES['apr?']
  apr = get_value / 100
  prompt MESSAGES['duration?']
  duration_in_years = get_value

  monthly_interest = apr / 12
  duration_in_months = (duration_in_years * 12).to_i
  monthly_payment = (principal * (monthly_interest / (1 - (1 + monthly_interest)**(-duration_in_months)))).round(2)
  total_paid = (monthly_payment * duration_in_months).round(2)
  total_interest = ((monthly_payment * duration_in_months) - principal).round(2)
  percent_interest = ((1 - (principal / total_paid)) * 100).round(2)

  prompt "Your monthly payment will be $#{monthly_payment}"
  prompt "Your total amount paid will be $#{total_paid} ."
  prompt "Altogether, you will pay $#{total_interest} in interest."
  prompt "This means #{percent_interest}% of what you will pay is interest."

  prompt MESSAGES['continue?']
  continue = gets.chomp
  break if continue.downcase.start_with?('n')
end
