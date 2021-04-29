def format_date(date)
  return date unless date =~ /-/
  former_date = date.split(/-/)
  former_date.reverse.join('.')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)