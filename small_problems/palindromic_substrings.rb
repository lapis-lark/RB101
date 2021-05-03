require 'benchmark'

def leading(str)
  str.chars.map.with_index { |_c, i| str[0..i] }
end

def substrings(str)
  substrings = []
  str.size.times { |i| substrings += leading(str[i..-1]) }
  substrings
end

def palindromes1(str)
  substrings(str).select do |word|
    word.size > 1 && word == word.reverse
  end
end

def palindromes2(str)
  substrings(str).select do |word|
    word == word.reverse && word.size > 1
  end
end

puts Benchmark.measure {
  50_000.times { palindromes1('racecarpotato') }
}

puts Benchmark.measure {
  50_000.times { palindromes2('racecarpotato') }
}
