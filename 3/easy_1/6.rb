famous_words = "seven years ago..."

# prepend is destructive
puts famous_words.prepend('Four score and ')
puts famous_words

famous_words = "seven years ago..."

famous_words = 'Four score and ' + famous_words
puts famous_words

famous_words = "seven years ago..."

# famous words not modified, 'Four score and ' is
'Four score and ' << famous_words
puts famous_words