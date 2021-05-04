def balanced?(str)
  match = Hash.new(0)

  str.chars.each do |c|
    case c
    when '(' then match[:parentheses] += 1
    when ')' then match[:parentheses] -= 1
    when '{' then match[:curly] += 1
    when '}' then match[:curly] -= 1
    when '[' then match[:square] += 1
    when ']' then match[:square] -= 1
    when "'" then match[:single] += 1
    when '"' then match[:double] += 1
    end
    break false if match.values.any? { |v| v < 0 }
  end
  match[:single] %= 2
  match[:double] %= 2
  match.values.all? { |v| v == 0 }
end

def balanced?(string)
  open, close = 0, 0
  string.scan(/[\(\[\{\)\]\}]/).each do |character|
    character =~ /[\(\[\{]/ ? open += 1 : close += 1
    break if close > open
  end
  quotes = string.scan(/(?<=[^a-z])'|'(?=[^a-z])|"/i).size
  open == close && quotes.even?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('""') == true
p balanced?("''") == true
p balanced?('{}') == true
p balanced?('[]') == true
p balanced?('()[]""{}}') == false
p balanced?('()[]"""{}') == false
p balanced?('[[}}')

