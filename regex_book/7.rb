def format_date(former_date)
  former_date.sub(/\A(\d\d\d\d)[-\/](\d\d)[-\/](\d\d)\z/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)