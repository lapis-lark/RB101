def dms(angle)
  degrees = angle.to_i
  minutes = (angle - degrees) * 60
  seconds = (minutes - minutes.to_i) * 60

  puts "#{degrees}°#{minutes.round.to_i}'#{seconds.round.to_i}\""
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")