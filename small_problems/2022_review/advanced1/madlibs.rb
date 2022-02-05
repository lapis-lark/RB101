text = File.read("madlibs.txt")

REPLACE = {
  adjective: %w(stultifying edifying mystifying enchanting alluring endearing
  trite quiet swift ungainly dastardly unseemly),
  noun: %w(puppy rock potato thermos glasses elbow drool computer mystery),
  adverb: %w(troublingly absurdly rapidly mysteriously spookily),
  verb: %w(slices chomps injects maps finds develops encounters slays)
}


text = text.split.each do |word|
  part_of_speech = word.delete('^a-zA-Z').to_sym
  next unless REPLACE.keys.include?(part_of_speech)
  word.gsub!(/%{\w+}/, REPLACE[part_of_speech].sample)
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
