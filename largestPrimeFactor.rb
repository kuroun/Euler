require './prime'
# largest prime factor is number is greatest than any prime factor
# prime factor of a number X is number is a multiply of X which is a prime number
puts "My solution:"
def largestPrimeFactor n
  m = n
  (n-1).downto(2).each do |i|
    if(m%i==0 && prime?(i))
      m =i 
    end
  end
  m
end
puts largestPrimeFactor 600851475143

puts "Optimize solution:"
def big_prime(x)
  prime = x
  (2..Math.sqrt(x).to_i).each do |i|
    break if prime <= i
    prime /= i while (prime > i && prime % i == 0)
  end
  prime
end
s = Time.new
puts big_prime(600851475143)
puts "elapsed: #{Time.new-s}"
