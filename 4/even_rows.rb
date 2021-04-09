def even_rows num
  row_array = build_rows(num)
  row_array[num - 1].inject(:+)
end

def build_rows num
  rows = [[]]
  value = 2

  num.times do |row|
    (row + 1).times do
      if rows[row] == nil
        rows[row] = [value]
      else
        rows[row] << value
      end
      value += 2
    end
  end

  rows
end


# prettier recursive solution
def row_start num
  num == 1 ? 2 : ((num - 1) * 2) + row_start(num - 1)
end

def recursive_row num
  row = [row_start(num)]
  (num - 1).times { |x| row << (row[x] + 2) }
  row.inject(:+)
end

p even_rows(1)
p even_rows(2)
p even_rows(3)
p even_rows(4)
p even_rows(5)
puts ''
p recursive_row(1)
p recursive_row(2)
p recursive_row(3)
p recursive_row(4)
p recursive_row(5)