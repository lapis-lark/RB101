def formatted_lines(n)
  lines = []
  (n / 2).times do |space|
    lines << "*#{' ' * space}*#{' ' * space}*".center(n)
  end
  lines
end

def star(n)
  lines = formatted_lines(n)
  all_lines = lines.reverse + ['*' * n] + lines
  all_lines.each { |l| puts l}
end

star(1)
star(31)