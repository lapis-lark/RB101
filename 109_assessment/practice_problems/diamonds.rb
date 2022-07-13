def diamonds(n)
  top = []
  middle = ['*' * n]
  (n / 2).times {|i| top << (('**' * i) << '*').center(n) }

  puts (top + middle + top.reverse)
end

diamonds(1)
diamonds(3)
diamonds(5)
diamonds(9)

