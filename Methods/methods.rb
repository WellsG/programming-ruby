# A method name may end with one of ? , ! , or = . Methods that return a boolean result (so-
# called predicate methods) are often named with a trailing ? :
puts 1.even?
puts 2.even?
puts 1.instance_of?(Fixnum)

# Ruby lets you specify default values for a method’s arguments—values that will be used if
# the caller doesn’t pass them explicitly
def cool_dude(arg1="Miles", arg2="Coltrane", arg3="Roach")
  puts "#{arg1}, #{arg2}, #{arg3}"
end

cool_dude
cool_dude("Bart")
cool_dude("Bart", "Elood")
cool_dude("Bart", "Elood", "Linus")

# But what if you want to pass in a variable number of arguments or want to capture multiple
# arguments into a single parameter?
def varargs(arg1, *rest)
  puts "arg1=#{arg1}. rest=#{rest.inspect}"
end

varargs("one")
varargs("one", "two")
varargs "one", "two", "three"

##
print "(t)imes or (p)lus: "
operator = gets
print "number: "
number = Integer(gets)

if operator =~ /^t/
  puts((1..10).collect {|n| n*number }.join(", "))
else
  puts((1..10).collect {|n| n+number }.join(", "))
end

# This works, but it’s ugly, with virtually identical code on each branch of the if statement. It
# would be nice if we could factor out the block that does the calculation:

print "(t)imes or (p)lus: "
operator = gets
print "number: "
number = Integer(gets)

if operator =~ /^t/
  calc = lambda {|n| n*number}
else
  calc = lambda {|n| n+number}
end
puts((1..10).collect(&calc).join(", "))

# If the last argument to a method is preceded by an ampersand (&), Ruby assumes that it is a Proc
# object. It removes it from the parameter list, converts the Proc object into a block, and associates
# it with the method.


# Hash and Keyword Arguments
def search(field, genre: nil, duration: 120)
  p [field, genre, duration]
end

search(:title)
search(:title, duration: 432)
search(:title, duration: 432, genre: "jazz")

# You can collect these extra hash arguments as a hash parameter—just prefix one element of
# your argument list with two asterisks (a double splat).
def search(field, genre: nil, duration: 120, **rest)
  p [field, genre, duration, rest]
end

search(:title, duration: 432, stars: 3, genre: "jazz", tempo: "slow")
# or
options = { duration: 432, stars: 3, genre: "jazz", tempo: "slow" }
search(:title, options)
