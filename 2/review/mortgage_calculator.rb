def prompt(str)
  puts "~~> #{str}"
end

def valid_num
  loop do
    num = gets.chomp
    break num.to_f if num.to_i.to_s == num && num.to_i > 0
    prompt('invalid, try again: ')
  end
end

loop do
  prompt('loan amount: ')
  loan_amount = valid_num
  prompt('annual percentage rate (APR): ')
  apr = valid_num * 0.01
  prompt('loan duration in months: ')
  loan_duration = valid_num
  monthly_interest = apr / 12

  monthly_payment = loan_amount * (monthly_interest /
                    (1 - (1 + monthly_interest)**(-loan_duration)))

  payment_total = (monthly_payment * 120).round(2)

  prompt("monthly payment: $#{format('%.2f', monthly_payment.round(2))}")
  prompt("total payment over 120 months: $#{format('%.2f', payment_total)}")

  puts ''
  prompt("type 'q' to quit or anything else to calculate another mortgage: ")
  break if gets.chomp == 'q'

  prompt('thanks, calculate again!')
end
