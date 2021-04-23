def staggered_case(str, toggle = false, count_syms = false)
  str.chars.map do |c|
    toggle = !toggle if /[a-zA-Z]/.match(c) || count_syms
    toggle ? c.upcase : c.downcase
  end.join
end

p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') #== 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'