sum_square = 0
sum = 0
(1..100).each do |i|
  sum_square += i**2
  sum += i
end
square_sum = sum**2
puts "sum_square: #{sum_square}"
puts "square_sum: #{square_sum}"
puts "Difference: #{square_sum-sum_square}"
