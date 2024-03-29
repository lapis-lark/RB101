def staggered_case(str)
  upcase = true
  str.chars.each do |char|
    upcase ? char.upcase! : char.downcase!
    upcase = !upcase
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
