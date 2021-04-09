MIN_PER_DAY = 1440

def after_midnight(standard_time)
  hours, minutes = standard_time.split(':').map(&:to_i)
  ((hours * 60) + minutes) % MIN_PER_DAY
end

def before_midnight(standard_time)
  (MIN_PER_DAY - after_midnight(standard_time)) % MIN_PER_DAY
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') #== 0
p after_midnight('12:34') #== 754
p before_midnight('12:34') #== 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0
