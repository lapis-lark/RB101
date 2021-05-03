def diamond(size)
  diamond = []
  1.upto(size) { |x| diamond.push('*' * x) if x.odd? }
  diamond << diamond.reverse.uniq
  diamond.flatten!.each { |x| puts x.center(size) }
end

diamond(20)
