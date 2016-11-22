# http://culttt.com/2015/05/13/what-are-lambdas-in-ruby/
# If you already have a background in programming,
# you might have already come across the word lambda.
# A lambda is also commonly referred to as an anonymous function.
#
# To create a lambda in Ruby, you can use the following syntax:
#
# lambda = lambda {}
# lambda ->() {}

lambda = -> (name) { puts "Hello #{name}"}
proc = Proc.new { |name| puts "Hello #{name}" }

lambda.call("John")
proc.call("John")

lambda.call()
proc.call()
