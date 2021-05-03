# test if letter in sentence
# if not, return false
# true at bottom

PAIRS = [["B", "O"], ["X", "K"], ["D", "Q"],
         ["C", "P"], ["N", "A"], ["G", "T"],
         ["R", "E"], ["F", "S"], ["J", "W"],
         ["H", "U"], ["V", "I"], ["L", "Y"],
         ["Z", "M"]]

def block_word?(word)
  valid = PAIRS.dup
  word.upcase.chars.each do |c|
    return false unless valid.flatten.include?(c)
    valid.reject! { |pair| pair.include?(c) }
  end
  true
end

# Launch School Solution
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') #== true
p block_word?('BUTCH') #== false
p block_word?('jest') #== true
p block_word?('hello')
p block_word?('HELLO')
p block_word?('BACK')
