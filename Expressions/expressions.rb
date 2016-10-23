# A common idiom is to use ||= to assign a value to a variable only if that variable isn’t already
# set:

var ||= "default value"
puts var

# defined?
# The defined? operator returns nil if its argument (which can be an arbitrary expression) is not
# defined; otherwise, it returns a description of that argument. If the argument is yield , defined?
# returns the string “yield” if a code block is associated with the current context.
puts defined? 1
puts defined? dummy
puts defined? printf
puts defined? String
puts defined? $_
puts defined? Math::PI
puts defined? a = 1
puts defined? 42.abs
puts defined? nil

