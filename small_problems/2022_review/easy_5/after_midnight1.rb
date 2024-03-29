def time_of_day(time)
  hours = (time.abs / 60) % 24
  minutes = time.abs % 60

  if time >= 0
    format('%02d:%02d', hours, minutes)
  else
    format('%02d:%02d', 23 - hours, 60 - minutes)
  end
end


p time_of_day(0) #== "00:00"
p time_of_day(-3) #== "23:57"
p time_of_day(35) #== "00:35"
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) #== "13:20"
p time_of_day(-4231) #== "01:29"