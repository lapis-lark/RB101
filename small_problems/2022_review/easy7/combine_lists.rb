# the boring solution
def interleave(arr1, arr2)
  arr1.clone.zip(arr2).flatten
end

# more involved
def interleave(arr1, arr2)
  new_arr = []
  until arr1.empty?
    new_arr << arr1.shift << arr2.shift
  end
  new_arr
end

arr1 = %w(1 2 3)
arr2 = %w(a b c)

arr1_id = arr1.object_id

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

interleave(arr1, arr2)

p arr1_id != arr1.object_id