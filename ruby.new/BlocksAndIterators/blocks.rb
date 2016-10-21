# A block is simply a chunk of code enclosed between either braces or the keywords do and
# end . The two forms are identical except for precedence, which we’ll see in a minute. All things
# being equal, the current Ruby style seems to favor using braces for blocks that fit on one line
# and do / end when a block spans multiple lines:

# a chunk of code enclosed between braces
some_array = [3, 4, 5, 1, 67, 32, 13, 89]
some_array.each { |value| puts value * 3 }

# or between the keywords do and end
sum = 0
some_array.each do |value|
  sum += value
end
puts "sum: " << sum.to_s

# you can define block-local variables by putting them after a semicolon in the block’s
# parameter list
sum = 0
[1, 2, 3, 4].each do |value; square|
  square = value * value
  sum += square
end
puts sum
