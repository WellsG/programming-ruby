# The Enumerable mixin provides collection classes with several traversal and searching methods,
#  and with the ability to sort. The class must provide a method each, which yields successive 
#  members of the collection. If Enumerable#max, #min, or #sort is used, the objects in the 
#  collection must also implement a meaningful <=> operator, as these methods rely on an ordering
#   between members of the collection.


# Public Instance Methods
# all? [{ |obj| block } ] → true or false
# Passes each element of the collection to the given block. The method returns true if the block
#  never returns false or nil. If the block is not given, Ruby adds an implicit block of { |obj|
#  obj } which will cause all? to return true when none of the collection members are false or nil.

p %w[ant bear cat].all? { |word| word.length >= 3 } #=> true
p %w[ant bear cat].all? { |word| word.length >= 4 } #=> false
p [nil, true, 99].all?                              #=> false
