def evenFib
  sum = 2
  a = 1
  b = 2
  i = 0
  while(i<4000000) do
    i = a + b
    sum +=i if(i%2 == 0) 
    a = b
    b = i
    #puts i
  end
  sum
end
puts evenFib