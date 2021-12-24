person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

key = :name
puts person.key?(key) ? "yes, #{key} is a key" : "not a key"
key = :potato
puts person.key?(key) ? "yes, #{key} is a key" : "not a key"