def diamond(n)
  mid = ['*' * n]
  top = []
  (n / 2).times { |i| top << ("*#{'**' * i}") }

  puts (top + mid + top.reverse).map { |line| line.center(n) }
end

diamond(5)
diamond(3)
diamond(9)
