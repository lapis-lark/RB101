# find all unique letters
# use as hash keys
# iterate across str, counting each letter

statement = "The Flintstones Rock".downcase

letters = statement.chars.uniq
freq = Hash.new

letters.each { |c| freq[c] = statement.count(c) }
p freq