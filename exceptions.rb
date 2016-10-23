def play(arg)
  cantry = true
  begin
    if arg == 0
      # Raising Exceptions
      raise ArgumentError, "0 is not a valid parameter."
    end
  
  rescue ArgumentError
    if cantry
      cantry = false
      puts "@@retry" 
      retry
    else
      raise
    end
  end
end

play 0
