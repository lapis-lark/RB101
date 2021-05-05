require 'pry-byebug'

MADLIBS = { 'adjective' => %w(silly sopping intrepid voluble equestrian fruity),
            'noun' => %w(potato cheese backpack donkey daffodil laptop pajamas),
            'adverb' => %w(swiftly silently deftly magically explosively
                           wordlessly),
            'verb' => %w(eats programs encounters obliterates naps dwells
                         messages) }

# take 1
def madlibs(file_name)
  text = File.read(file_name)

  text.split.map do |word|
    match = word.match(/(%{.+?})/)
    # byebug
    if match
      part = match[1].delete('^a-zA-Z')
      MADLIBS[part].sample
    else
      word
    end
  end.join(' ')
end

puts madlibs("madlibs_text.txt")

# refactored
text = File.read("madlibs_text.txt")

updated = text.split.each do |word|
  match = word.match(/(%{.+?})/)
  if match
    part = match[1].delete('^a-zA-Z')
    word.sub!(/(%{.+?})/, MADLIBS[part].sample)
  end
end.join(' ')

puts updated

# first problem of the day, cut me some slack

words = {
    adjective: ['quick', 'lazy', 'sleepy', 'ugly'],
    noun:      ['fox', 'dog', 'head', 'leg'],
    verb:      ['jumps', 'lifts', 'bites', 'licks'],
    adverb:    ['easily', 'lazily', 'noisily', 'excitedly']
}

text = File.open('madlibs_text.txt').read

text =  text.split(' ').map do |word|
          if word.start_with?('%')
            key = word.delete('^a-z').to_sym
            words[key].sample
          else
            word
          end
        end.join(' ')

puts text

adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverb=  %w(easily lazily noisily excitedly)

File.foreach("madlibs_text.txt") do |line|
  line.gsub!('%{adjective}', adjectives.sample)
  line.gsub!('%{noun}', nouns.sample)
  line.gsub!('%{verb}', verbs.sample)
  line.gsub!('%{adverb}', adverb.sample)
  puts line
end