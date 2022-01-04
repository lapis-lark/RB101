# (1..99).each { |n| puts n if n.odd? }

# 1.upto(99) { |n| puts n if n.odd? }

puts (1..99).to_a.select(&:odd?)
