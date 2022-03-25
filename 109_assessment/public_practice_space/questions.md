Hi, everyone! I have a few questions about the proper language used to describe programs on the written test. Each of my questions will use the following code snippet and solution as an example/reference. I'm not trying to get a language check here so much as I'm trying to establish some principles to better shape my description of code. Thank you all for any guidance! :)

### Example
```ruby
# Upon program completion, what is the value of 's'? Of 't'? Do 's' and 't' reference the same object?
def fix(value)
  value.upcase!
  value.concat('!')
  value
end


s = 'hello'
t = fix(s)
```

### Solution
Upon completion of the program, `s` and `t` both reference the same `String` object `'HELLO!'`.

On line 9, local variable `s` is assigned to the `String 'hello'`. Then on line 10, 
the method `#fix` is called with `s` passed in as an argument. Method parameter `value` references
the same object as `s` within the method. Within the method, `value` calls mutating method `#upcase!`, 
then calls mutating method `#concat` with `String '!'` passed in as an argument.
Local variable `t` is then assigned to the return value of `#fix` which is the implicitly returned evaluation of the last line, `value`.

Thus, `t` references the same object as `s` as only mutating methods have been called on the object referenced by `s`. There has been no reassignment which is not mutating and would create a reference to a new object.


1. Is using line numbers to describe the location of things always necessary? For example, I say "within the method", then walk line by line what happens rather than listing the line number of `#upcase!` and `#concat`. 
2. Is it appropriate to say that `value` calls `#upcase!`, or would saying that the `String` object `value` references calls `#upcase!` be better?
3. I refer to `value` as "method parameter `value` references the same object as `s` within the method" when first introducing it--is any additional clarity needed here to indicate that it is a local variable within the scope of the method?
4. Lastly, within this solution, I refer to the `String` methods as "mutating method `#example`". In this problem, it is important to emphasize that they are mutating methods. In another context, however, is it acceptable to reference methods merely with a syntax like "`#puts`" rather than "the method `#puts`"? How about in the case of methods with different class implementations? Is distinguishing between `Hash#each` and `Array#each` of importance in the average problem?

Thank you for your time!