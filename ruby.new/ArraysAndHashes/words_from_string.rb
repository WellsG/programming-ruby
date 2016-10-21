def words_from_string(string)
  string.downcase.scan(/[\w']+/)
end

p words_from_string("This is a test to arrays and containers.")
