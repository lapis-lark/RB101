def letter_case_count(str)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |c|
    type = case c
           when 'a'..'z' then :lowercase
           when 'A'..'Z' then :uppercase
           else :neither
           end
    hash[type] += 1
  end

  hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
