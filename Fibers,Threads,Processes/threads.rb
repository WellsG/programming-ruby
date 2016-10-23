require 'net/http'
pages = %w( www.rubycentral.org slashdot.org www.github.com )
threads = pages.map do |page_to_fetch|
  Thread.new(page_to_fetch) do |url|
    http = Net::HTTP.new(url, 80)
    print "Fetching: #{url}\n"
    resp = http.get('/')
    print "Got #{url}: #{resp.message}\n"
  end
end
threads.each {|thr| thr.join }

# When we create the thread, we pass the required URL as a parameter. This parameter is
# passed to the block as url . Why do we do this, rather than simply using the value of the
# variable page_to_fetch within the block?
#
# A thread shares all global, instance, and local variables that are in existence at the time the
# thread starts. As anyone with a kid brother can tell you, sharing isn’t always a good thing.
# In this case, all three threads would share the variable page_to_fetch . The first thread gets
# started, and page_to_fetch is set to "www.rubycentral.org" . In the meantime, the loop creating the
# threads is still running. The second time around, page_to_fetch gets set to "slashdot.org" . If the
# first thread has not yet finished using the page_to_fetch variable, it will suddenly start using
# this new value. These kinds of bugs are difficult to track down.
#
# However, local variables created within a thread’s block are truly local to that thread—each
# thread will have its own copy of these variables. In our case, the variable url will be set at
# the time the thread is created, and each thread will have its own copy of the page address.
# You can pass any number of arguments into the block via Thread.new .
count = 0
threads = 10.times.map do |i|
  Thread.new do
    sleep(rand(0.1))
    Thread.current[:mycount] = count
    count += 1
  end
end

threads.each {|t| t.join; print t[:mycount], ", " }
puts "count = #{count}"

# Threads and Exceptions

threads = 4.times.map do |number|
  Thread.new(number) do |i|
    raise "Boom!" if i == 1
    print "#{i}\n"
  end
end
puts "Waiting"
sleep 0.1
puts "Done"

# You normally don’t sleep waiting for threads to terminate—you’d use join . If you join to a
# thread that has raised an exception, then that exception will be raised in the thread that does
# the joining:

puts "Waiting"
threads.each do |t|
  begin
    t.join
  rescue RuntimeError => e
    puts "Failed: #{e.message}"
  end
end
puts "Done"
