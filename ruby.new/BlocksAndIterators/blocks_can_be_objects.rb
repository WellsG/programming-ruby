# create a Proc object in one instance method and store it in an
# instance variable. We then invoke the proc from a second instance method
class ProcExample
  def pass_in_block(&action)
    @stored_proc = action
  end
  def use_proc(parameter)
    @stored_proc.call(parameter)
  end
end

eg = ProcExample.new
eg.pass_in_block { | param | puts "The parameter is #{param}" }
eg.use_proc(99)

# you can go one step further. If a block can be turned
# into an object by adding an ampersand parameter to a method, what happens if that method
# then returns the Proc object to the caller?
def create_block_object(&block)
  block
end

bo = create_block_object { |param| puts "You called me with #{param}" }
bo.call 99
bo.call "cat"

# In fact, this is so useful that Ruby provides not one but two built-in methods that convert a
# block to an object. Both lambda and Proc.new take a block and return an object of class Proc .
puts "lambda way ..."
bo = lambda { |param| puts "You called me with #{param}" }
bo.call 99
bo.call "cat"
