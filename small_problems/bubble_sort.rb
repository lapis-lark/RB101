require 'benchmark'

def bubble_sort!(arr)
  size = arr.size - 1
  size.times do 
    size.times do |i|
      unless arr[i] < arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
    end
  end
  arr
end


# optimization/futher explorationc
def bubble_sortx!(arr)
  loop do
    swapped = false
    x = 1
    (1..(arr.size - x)).each do |i|
      unless arr[i] > arr[i - 1]
        arr[i], arr[i - 1] = arr[i - 1], arr[i]
        swapped = true
      end
    end
    x += 1
    break unless swapped
  end
  arr
end

array = [6, 2, 7, 1, 4]
puts Benchmark.measure {
  50_000.times do
bubble_sort!(array)
  end
}

puts Benchmark.measure {
  50_000.times do
bubble_sortx!(array)
  end
}

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)