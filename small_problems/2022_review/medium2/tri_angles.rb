def triangle(a1, a2, a3)
  angles = [a1, a2, a3].sort
  return :invalid if angles.sum != 180 || angles.include?(0)

  case angles.last
  when 0...90 then :acute
  when 90 then :right
  else :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid