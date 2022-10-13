def diamond(n)
  mid = ['*' * n]
  top = []
  (n / 2).times { |i| top << ("*#{'**' * i}") }

  puts (top + mid + top.reverse).map { |line| line.center(n) }
end

diamond(5)
diamond(3)
diamond(9)

#further
def hollow_diamond(n)
  top = ['*']
  (1..(n / 2)).each do |i|
    top << "*#{' ' * ((i * 2) - 1)}*"
  end

  bottom = top.reverse[1..-1]
  puts (top + bottom).map { |line| line.center(n) }
end

hollow_diamond(5)
hollow_diamond(9)
hollow_diamond(3)

=begin
  stars: 1,2,2,2,2,2,2,
      x: 0,1,2,3,4,

  spaces: 0,1,3,5,7
       x: 0,1,2,3,4
=end