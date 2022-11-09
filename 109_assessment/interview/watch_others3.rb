# problem: find the next biggest number that can be created from the digits that
            # compose a given integer; return -1 if impossible
# input: integer
# output: integer
# algorithm: 
  # convert to string
  # try swapping last two digits till match found  with iterator
  # return num if answer found
  # else return false after the iterator

  # swap the last two digits of a number; if they are the same, contin

  require 'byebug'

  def next_bigger_num(num)
    return -1 if num < 10
    -2.downto(-(num.digits.size)) do |i|
      n = num.to_s
      n[i], n[i + 1] = n[i + 1], n[i] 
      return n.to_i if n > num.to_s
    end
    -1
  end

  def next_bigger_num(num)
    max = num.digits.sort.reverse.join.to_i
    # byebug
    ((num + 1)..max).each do |n|
      return n if n.digits.sort == num.digits.sort
    end
    -1
  end

  def next_bigger_num(num)
    return 1 if num < 10

    -2.downto(-(num.digits.size)) do |i|
      n_arr = num.to_s.chars
      start = n_arr[0...i].join
      end_max = n_arr[i..-1].sort.reverse.join
      guess = (start + end_max).to_i
      # byebug
      return guess if guess > num
    end
    -1
  end
  

  p next_bigger_num(513)
  p next_bigger_num(9)
  p next_bigger_num(2017)
  p next_bigger_num(123465)
  p next_bigger_num(98756666)