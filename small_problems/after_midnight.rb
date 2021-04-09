def time_of_day(time_in_minutes)
  before_midnight = time_in_minutes < 0
  hours = (time_in_minutes.abs / 60) % 24
  minutes = time_in_minutes.abs % 60

  if before_midnight
    hours = 23 - hours
    minutes = 60 - minutes
  end

  format("%02d:%02d", hours, minutes)
end

p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
