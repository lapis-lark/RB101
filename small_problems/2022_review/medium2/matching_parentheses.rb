# logically I got the exaaaaact same result as LS
# however, since their solution only uses ints, it would be faster
def balanced?(str)
  left_par, right_par = [], []
  str.chars.each do |c|
    left_par << c if c == '('
    right_par << c if c == ')'
    return false if right_par.size > left_par.size
  end

  left_par.size == right_par.size
end

def balanced?(string)
  para1count = string.count('(')
  para2count = string.count (')')
  para1count == para2count
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false