=begin
def sequence(count, increment)
  increment.step(by: increment).take(count)
end

def sequence(count, increment)
  arr = []
  count.times do |i|
    if arr.empty?
      arr << increment
    else
      arr << (arr.last + increment)
    end
  end
end
=end

def sequence(count, increment)
  arr = []
  count.times do |i|
    case i
    when 0
      arr << increment
    else
      arr << (arr.last + increment)
    end
  end
  arr
end

def sequence(count, increment)
  return [] if count.zero?
  arr = [increment]
  count.times do |_i|
    arr << (arr.last + increment)
  end
  arr
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) # s== [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
