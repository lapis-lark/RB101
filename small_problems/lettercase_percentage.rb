def letter_percentages(str)
  percents = {}
  size = str.size.to_f

  percents[:lowercase] = str.count("a-z")
  percents[:uppercase] = str.count("A-Z")
  percents[:neither] = str.count("^a-zA-Z")
  
  percents.each do |k, v| 
    percents[k] = (v / size * 100).round(2)
  end
  percents
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }