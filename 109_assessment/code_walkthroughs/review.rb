# IMPORTANT
# capitalize class
  # String `'hello'`
  # Integer `3`
# left to right for assignment
  a = 'hello'
  # local variable `a` is assigned to String `'hello'`



a = 'hello' # local var `a` is assigned to string `'hello'`
b = a # local var 'b' is assigned to the object that `a` references, `'hello'`
a = 'goodbye' # `a` is reassigned to string `'goodbye'`

# However, because assignment is non-mutating, `b` is still pointing to `'hello'`. A new space in memory is allocated to `'goodbye'` for `a`.

def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')

# The method `example` is defined between lines 7-14. It has one parameter, `str`.
# Within the method, local variable `i` is assigned to `3`
# Then the method `loop` is called with a do..end block spanning lines 9-13.
# Within the block, `i` is reassigned to the return value of Integer#- called with 1 as an argument (2).
# Next, the loop method is broken out of if `i` equals `0`. If not, the block repeats.
# ON line 16, `example` is invoked with `'hello'` as an argument
# `'hello'` is output 3 times and `nil`, the default return value of `break`, is returned implicitly


