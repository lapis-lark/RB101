def century(year)
  cent = (year / 100)
  cent += 1 unless year.to_s[-1] == '0'

  last_two_digits = cent % 100
  cent = cent.to_s
  last_digit = cent[-1]

  return cent + 'th' if (4...20) === last_two_digits

  suffix = case last_digit
  when /1/ then 'st'
  when /2/ then 'nd'
  when /3/ then 'rd'
  else 'th'
  end

  cent + suffix
end



p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'