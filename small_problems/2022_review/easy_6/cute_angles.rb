DEGREE = "\xC2\xB0"

def dms(angle)
  angle = angle % 360

  hour = angle.to_i
  minute = (angle - hour) * 60
  second = (minute - minute.to_i) * 60
  
  minute = minute.to_i
  second = second.round

  format(%(#{hour}#{DEGREE}%02d'%02d"), minute, second)
end

p dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")