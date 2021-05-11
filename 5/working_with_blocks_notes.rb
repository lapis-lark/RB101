# when evaluating a method called with a block, ask:
  # what is the object the action is being performed on
  # are there side effects? (output or destruction)
  # what is the return value?
  # is the return value used by the method?

  # line  :
    # action:
    # object:
    # side effect: 
    # return val: 
    # return used?: 

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

  # line 1 : 
    # action: var_assignment
    # object: my_arr
    # side effect: none
    # return val: assigned val (the nested array each called on)
    # return used?: no

  # line 1 :
    # action: method call (each)
    # object: outer array
    # side effect: none
    # return val: outer array
    # return used?: yes, in assignment

  # line 1-7 : 
    # action: execute block
    # object: each nested arr
    # side effect: none
    # return val: each sub_arr
    # return used?: yes, to evaluate block

  # line 2 :
    # action: each method call 
    # object: sub arrs
    # side effect: none
    # return val: sub_arr
    # return used?: yes, to evaluate outer block

  # line 2-6 :
    # action: block execution
    # object: each element of sub arr
    # side effect: none
    # return val: nil or num
    # return used?: no

  # line 3-5 :
    # action: test if val is greater than 5 
    # object: each val of sub arr
    # side effect: none
    # return val: nil
    # return used?: na

  # line 4 :
    # action: output num
    # object: num
    # side effect: output
    # return val: nil
    # return used?: yes, to evalutate block

USING_SORT_BY_ON_NESTED_ARRAYS

arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

# as long as the return value is sortable, this will work

# without nested arrays:
a = ['aaaa', 'bbb', 'cc', 'd']
a.sort_by! {|element| element.size }
a # => ["d", "cc", "bbb", "aaaa"]

# using two iterative methods in tandem is required to go over each element of nested arrays

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

# DON'T DELETE ELEMENTS OF A COLLECTION YOU ARE ITERATING THROUGH
# try this instead

def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end