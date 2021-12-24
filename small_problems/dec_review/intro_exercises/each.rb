arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

#arr.each { |num| puts num }

#arr.each { |num| puts num if num > 5 }

puts arr.select { |num| num.odd? }
=begin
arr.unshift(0)
arr.push(11)
arr.delete(11)
arr << 3
arr.uniq!

p arr


foo = { howdy: 'pard'}
bar = { :hola => 'amigo'}

p (foo.merge(bar))
=end 


h = {a:1, b:2, c:3, d:4}

p h[:b]
h[:e] = 5
p h
h = h.select { | _, v| v >= 3.5 }
p h 