## Arrays

a = [ 1, 'cat', 3.14 ]
puts "The first element is #{a[0]}"

# In many languages,the concept of nil (or null) means 
# “no object.” In Ruby, that’s not the case; nil is an object,
# just like any other, that happens to represent nothing.

a[2] = nil 
puts "The array is now #{a.inspect}"


# Sometimes creating arrays of words can be a pain, 
# what with all the quotes and commas.
a = [ 'ant', 'bee', 'cat', 'dog' ]
puts a[0]
puts a[3]

# Fortunately, Ruby has a shortcut; %w does just what we want:
a = %w{ ant bee cat dog }
puts a[0]
puts a[3]


## Hashes

inst_section = {
  'cello' => 'string',
  'drum'  => 'brass'
}

puts inst_section['cello']
