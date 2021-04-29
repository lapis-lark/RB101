def longest_sentence(text)
  longest = ''
  text.split(/[.?!]/).map do |sent|
    longest = sent if sent.size > longest.size
  end
  longest
end

# modified original based on launch
def longest_sentence(text)
  text.split(/[.?!]/).max_by do |sent|
    sent.split.size
  end
end

# not quite working. . .
def longest_paragraph(text)
  text.split(/\n\b/).max_by do |paragraph|
    paragraph.size
  end
end

def longest_word(text)
  text.split(/[\s\-;.,!?]/).max_by do |word|
    word.size
  end
end

book = File.read("frankenstein.txt").chomp
#puts longest_sentence(book).split.size
puts longest_paragraph(book)
#puts longest_word(book).size
