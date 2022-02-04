require 'benchmark'

def bubble_sort_tail!(arr)
  round = 1
  loop do
    swap = false
    (arr.size - round).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swap = true
      end
    end

    break unless swap
    round += 1
  end
end

def bubble_sort!(arr)
  loop do
    swap = false
    (arr.size - 1).times do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swap = true
      end
    end

    break unless swap
  end
end

puts Benchmark.measure {
  500000.times do
    array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
    bubble_sort!(array)
    array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
  end
}

puts Benchmark.measure {
  500000.times do
    array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
    bubble_sort_tail!(array)
    array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
  end
}
