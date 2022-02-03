def triangle(num, corner)
  lines = []
  num.times { |i| lines << ('*' * (i + 1)).rjust(num) }

  lines.map! { |l| l.reverse } if corner[1] == 'l'
  lines.reverse! if corner[0] == 't'

  puts lines
end

triangle(5, 'bl')
triangle(5, 'br')
triangle(5, 'tl')
triangle(5, 'tr')