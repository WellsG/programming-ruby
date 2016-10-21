def say_goodnight(name)
  result = "Good night," + name
  return result
end

def say_goodnight2(name)
  result = "Good night, #{name}"
end

def say_goodnight3(name)
  result = "Good night, #{name.capitalize}"
end

# The value returned by a Ruby method
# is the value of the last expression evaluated,
# so we can get rid of the temporary variable and
# the return statement altogether.
def say_goodnight4(name)
  "Good night, #{name.capitalize}"
end

## Test
puts say_goodnight("John")
puts say_goodnight2("Mike")
puts say_goodnight3("uncle")
puts say_goodnight4("ma")
