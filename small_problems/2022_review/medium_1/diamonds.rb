def diamond(n)
  arr = []
  half = (n / 2) + 1
  stars = 1
  padding = n / 2

  half.times { |row| arr << (' ' * (padding - row) + '*' * (stars + 2 * row)) }

  arr += arr[0...-1].reverse

  puts arr
end

diamond(3)
diamond(5)
diamond(9)

# further
def hollow_diamond(n)
  arr = []
  half = (n / 2) + 1
  l_padding = n / 2

  half.times do |row|
    top = (' ' * (l_padding - row) + '*')
    middle = (' ' * (row.zero? ? 0 : row * 2 - 1))
    bottom = ('*' * (row.zero? ? 0 : 1))
    arr << (top + middle + bottom)
  end

  arr += arr[0...-1].reverse

  puts arr
end

hollow_diamond(3)
hollow_diamond(5)
hollow_diamond(9)
