def egyptian(rational)
  denominators = []
  den = 0
  sum = Rational(0, 1)

  until sum == rational
    den += 1
    fraction = Rational(1, den)

    next if sum + fraction > rational
    denominators << den
    sum += fraction
  end

  denominators
end

def unegyptian(denominators)
  denominators.inject(Rational(0)) { |memo, d| memo + Rational(1, d) }
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
  # if denominators.inject { |memo, d| memo += Rational(1, d) } == rational
=begin
  loop do
    fraction = Rational(num, den)
    case 
    when sum + fraction > rational then den += 1
    when sum + fraction  

  end
=end
