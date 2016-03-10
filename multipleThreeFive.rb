def sum a, b, n
  sum = 0
  m = a
  m = b if(m > b)
 (m...1000).each do |i|
    sum += i if(i%a == 0 || i%b == 0) 
  end
  sum
end
puts sum 3, 5, 1000