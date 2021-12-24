def down_to_zero(num)
  return if num < 0
  puts num
  down_to_zero(num - 1)
end

down_to_zero(15)

