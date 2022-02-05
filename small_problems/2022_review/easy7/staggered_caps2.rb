def staggered_case(str)
  upcase = true
  str.chars.each do |char|
    if char =~ /[a-zA-z]/
      upcase ? char.upcase! : char.downcase!
      upcase = !upcase
    end
  end.join
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'