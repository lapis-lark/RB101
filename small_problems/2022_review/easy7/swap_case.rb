def swapcase(str)
  str.chars.map { |c| c =~ /[a-z]/ ? c.upcase : c.downcase }
  .join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'