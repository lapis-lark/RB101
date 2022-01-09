def palindromic_number?(num)
  num.to_s == num.digits.join
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(00055000) == true