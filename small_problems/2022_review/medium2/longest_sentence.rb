def print_longest_sentence(text)
  longest = []
  line = []
  text.split.each do |word|
    unless %w(. ? !).include?(word[-1])
      line << word
      next
    end
    line << word
    longest = line if longest.size < line.size
    line = []
  end

  puts "The longest sentence (#{longest.size} words) is:\n#{longest.join(' ')}"
end

def longest_word(text)
  text.gsub(/\W/, ' ').split.max_by(&:size)
end

frankenstein = File.read("frankenstein.txt")
domnei = File.read("domnei.txt")

p longest_word(frankenstein)
p longest_word(domnei)
