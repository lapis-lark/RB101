def swap_name(first_last)
  first_last.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'