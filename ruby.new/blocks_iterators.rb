# A method can then invoke an associated block one or more times using the Ruby yield
# statement. You can think of yield as being something like a method call that invokes the block
# associated with the call to the method containing the yield .

def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end

call_block { puts "In the block" }

# You can provide arguments to the call to yield , and they will be passed to the block. Within
# the block, you list the names of the parameters to receive these arguments between vertical
# bars ( |params...| ). The following example shows a method calling its associated block twice,
# passing the block two arguments each time:

def who_says_what
  yield("Dave", "hello")
  yield("Andy", "goodbye")
end

who_says_what { |person, phrase| puts "#{person} syas #{phrase}" }

# Code blocks are used throughout the Ruby library to implement iterators, which are methods
# that return successive elements from some kind of collection, such as an array:

animals = %w{ ant bee cat dog }
animals.each { |animal| puts animal }

# Many of the looping constructs that are built into languages such as C and Java are simply
# method calls in Ruby, with the methods invoking the associated block zero or more times:
[ 'cat', 'dog', 'horse' ].each{ |name| print name, " " }
5.times { print "*" }
3.upto(6) { |i| print i }
( 'a'..'e' ).each { |char| print char }
puts 

