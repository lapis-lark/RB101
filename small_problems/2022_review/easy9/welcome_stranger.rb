def greetings(name_arr, job_hash)
  puts "Howdy, #{name_arr.join(' ')}! Great to have a " \
       "#{job_hash.values.join(' ')} around!"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
