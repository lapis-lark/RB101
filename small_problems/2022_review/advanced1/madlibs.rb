ADJECTIVES = %w(stultifying edifying mystifying enchanting alluring endearing
                trite quiet swift ungainly dastardly unseemly)
NOUNS = %w(puppy rock potato thermos glasses elbow drool computer mystery)
ADVERBS = %w(troublingly absurdly rapidly mysteriously spookily)
VERBS = %w(slices chomps injects maps finds develops encounters slays)

text = File.read("madlibs.txt")

text = text.split.each do |word|
  word.gsub!(/%{adjective}/, ADJECTIVES.sample)
  word.gsub!(/%{noun}/, NOUNS.sample)
  word.gsub!(/%{adverb}/, ADVERBS.sample)
  word.gsub!(/%{verb}/, VERBS.sample)
end.join(' ')

# doesn't handle trailing punctuation
=begin
text.split.map do |word|
  case word
  when '%{adjective}' then ADJECTIVES.sample
  when '%{noun}' then NOUNS.sample
  when '%{adverb}' then ADVERBS.sample
  when '%{verb}' then VERBS.sample
  else word
end
=end

puts text
