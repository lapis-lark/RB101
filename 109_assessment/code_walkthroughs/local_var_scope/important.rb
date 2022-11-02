# LOCAL VARIABLE SCOPE TOPICS

# Two big topics: methods and blocks
  # methods have self-contained scope
  # BLOCKS create a new scope but have access to outer scope
    # blocks are delimited by do..end or {} and follow a method invocation
    # do..end and {} following key words are NOT blocks (for/while loops, for instance)
    # thus, scoping rules do not change in these cases

# trying to call a variable that was defined in an inner scope when outside that scope
# results in an error (NameError, undefined local var or method)

# peer scopes do not conflict
# blocks can be nested

# VARIABLE SHADOWING

# block parameters will overshadow outer scope variables
  # when this happens, the outer scope variable will be inaccessible

# OTHER

# ruby first tries to find a local var of given name, then looks for methods of that name
# the rules for blocks remain the same even within methods (duh)



