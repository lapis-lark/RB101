require 'date'
require 'benchmark'

def friday_13th(year)
  (1..12).inject(0) do |fri, month|
    fri + (Date.new(year, month, 13).friday? ? 1 : 0)
  end
end

def five_fridays(year)
  (1..12).inject(0) do |memo, month|
    last = Date.new(year, month, -1)
    dates = [last, last - 1, last - 2]
    dates.any? { |date| date.day > 28 && date.friday? } ? memo + 1 : memo
  end
end

def five_fridays(year)
  (1..12).select do |month|
    last = Date.new(year, month, -1)
    dates = [last, last - 1, last - 2]
    dates.any? { |date| date.day > 28 && date.friday? }
  end.size
end

def five_fridays_jason_wang(year)
  Date.new(year).step(Date.new(year, -1, -1))
      .select(&:friday?)
      .group_by(&:month)
      .select { |_, fridays| fridays.length > 4 }
      .keys
end

puts Benchmark.measure {
  50000.times do
    five_fridays(2020)
  end
}

puts Benchmark.measure {
  50000.times do
    five_fridays_jason_wang(2020)
  end
}

# as expected, my solution is substantially
# faster since it only looks at the last three days of each month
