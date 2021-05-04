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

# best solution found (by Ricky Viejo)

def balanced_chars?(str, chars)
  count = 0
  str.each_char do |char|
    count += 1 if char == chars[0]
    count -= 1 if char == chars[1]
    break if count < 0
  end
  count.zero?
end

def balanced?(str)
  chars = %w(() {} '' "")
  chars.all? {|char| balanced_chars?(str, char)}
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

