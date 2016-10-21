# There’s no need to assign some kind of value to a symbol—Ruby takes care of that for you.
# Ruby also guarantees that no matter where it appears in your program, a particular symbol
# will have the same value.

inst_section = {
  :cello  => 'string',
  :drum   => 'brass' 
}

puts inst_section[:cello]

# In fact, symbols are so frequently used as hash keys that Ruby has a shortcut syntax: you
# can use name: value pairs to create a hash if the keys are symbols:

inst_section2 = {
  cello: 'string',
  drum:  'brass'
}

puts inst_section2[:cello]
