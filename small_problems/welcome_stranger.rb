def greetings(name, employment)
  puts "Howdy, #{name.join(' ')}! "\
  "Always a pleasure to meet a #{employment.values.join(' ')}"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
