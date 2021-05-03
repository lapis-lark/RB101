# no #reverse
=begin
def reverse_sentence(string)
  string = string.split(' ')
  new_string = []
  string.each { |word| new_string.unshift(word)}
  new_string.join(' ')
end
=end

# with #reverse
def reverse_sentence(string)
  string.split(' ').reverse.join(' ')
end
=begin
def reverse_if_big(string)
  reversed = string.split.map do |word|
    word.length > 4 ? word.reverse : word
  end
  reversed.join(' ')
end
=end

def reverse_if_big(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.length >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_if_big('Walk around the block')
