require 'date'

def friday_13th(year)
  count = 0
  (1..12).each do |month| 
    count += 1 if Date.new(year, month, 13).friday?
  end
  count
end

# much inspiration from Eugene O'Fallion
def five_fridays(year)
  fridays = Hash.new(0)
  first_day = Date.new(year, 1, 1)
  last_day = Date.new(year, 12, 31)

  (first_day..last_day).each do |date|
    fridays[date.month] += 1 if date.friday?
  end

  fridays.values.count(5)
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
p five_fridays(2011)
p five_fridays(2003)