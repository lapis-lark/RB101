def multisum(num)
  mult3 = (3..num).step(3).to_a
  mult5 = (5..num).step(5).to_a
  (mult3 + mult5).uniq.sum
end


p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) #== 234168