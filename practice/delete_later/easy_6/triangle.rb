def triangle(n)
  (1..n).each do |i|
    puts ('*' * i).rjust(n)
  end
end

triangle(5)

triangle(9)