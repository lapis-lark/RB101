def has_lab arr
  arr.each { |str| str =~ /lab/ ? (puts str) : next }
end

words = ['laboratory', 'experiment', 'Pans Labyrinth', 'elaborate', 'polar bear']

has_lab words