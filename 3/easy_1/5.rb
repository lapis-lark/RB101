puts (10...100).include?(42.5)
puts (10...100).cover?(42.5)
# include? behaves like cover? when numeric,
# but differently with other ranges
puts ("a".."z").include?("cc")
puts ("a".."z").cover?("cc")

