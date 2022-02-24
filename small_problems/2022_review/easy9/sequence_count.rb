# derp, the LS mental model of the problem is much simpler

# LS solution
def sequence(count, first)
  (1..count).map { |value| value * first }
end

def sequence(n1, n2)
  arr = []
  n1.times { |i| arr.empty? ? arr << n2 : arr << (arr[-1] + n2) }
  arr
end

def sequence(n1, n2)
  (1..n1).inject([]) { |mem, i| mem.empty? ? [n2] : mem << (mem[-1] + n2) }
end

p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []