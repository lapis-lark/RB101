=begin
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

    what is != and where should you use it?
    put ! before something, like !user_name
    put ! after something, like words.uniq!
    put ? before something
    put ? after something
    put !! before something, like !!user_name
Answer:
! is the not operator and switches the true/false value
of the following object
! can also signify that a method is destructive
? begins a ternary statement where if the condition
before ? is true, the statement after ? is executed,
else the statement after : is executed

1. != is the not equals operator; often used in conditionals;
2. will return false if user_name a string
3. (often) signifies it's a destructive method
4. ternary operator
5. (often) signifies it returns true/false value
6. returns bool equivalent of an object



=end

