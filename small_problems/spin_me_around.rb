DEGREE = "\xC2\xB0"

def dms(float)
  float = (float % 360)
  degrees = float.to_i
  minutes = (float % 1) * 60
  seconds = ((minutes * 100) % 1) * 60
  puts format("%d#{DEGREE}%02d\'%02d\"", degrees, minutes, seconds)
end

def dms(float)
  float = float.to_f
  total_seconds = (float * 3600).round
  total_minutes, seconds = total_seconds.divmod(60)
  degrees, minutes = total_minutes.divmod(60)
  puts format("%d#{DEGREE}%02d\'%02d\"", degrees, minutes, seconds)
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(390°00'00") || dms(360) == %(0°00'00")
