def letter_percentages(str)
  results = {uppercase: 0.0, lowercase: 0.0, neither: 0.0}
  str.chars.each do |c|
    case c
    when 'A'..'Z' then results[:uppercase] += 1
    when 'a'..'z' then results[:lowercase] += 1
    else results[:neither] += 1
    end
  end
  results.each { |k, v| results[k] = (v / str.size * 100).round(1) }
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }