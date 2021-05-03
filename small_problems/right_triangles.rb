def triangle(base)
  (0...base).reverse_each { |i| puts ('*' * (base - i)).to_s.rjust(base) }
end

def triangle(base)
  base.times { |i| puts ('*' * (i + 1)).to_s.rjust(base) }
end
=begin
def triangle(base)
  blanks, stars = (base - 1), 1
  until stars > base
    puts "#{' ' * blanks + '*' * stars}"
    blanks -= 1
    stars += 1
  end
end
=end

triangle(5)
triangle(10)
