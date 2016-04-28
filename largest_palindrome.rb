require 'benchmark'
class String
  def palindrome?
    (self.length/2).times do |i|
      #puts self[-1-i] + "-" + self[i]
      return false if(self[-1-i] != self[i]) 
    end
    true
  end
end
def largest_palindrome
  max = 999*999
  min = 111*111 #because, 1*1, 11*11, 111*111 are alway palindrome
  max.downto(min).each do |i|
    999.downto(100).each do |j|
      if(i%j==0 && (i/j).to_s.size == 3 && i.to_s.palindrome?)
        return i.to_s
      end
    end
  end
end
def largest_palindrome_opt
  999.downto(100).each do |n|
    #here is the mathematic formula. to generate palindrome number with 6 digit
    #http://math.stackexchange.com/questions/97752/generating-numeric-palindromes
    str = (1100 * n) - (990 * (n / 10)) - (99 * (n / 100))
    999.downto(100).each do |i| 
      return str if(str%i==0 && (str/i).to_s.length==3)
    end
  end
end


# Benchmark.bm(10) do |x|
  # x.report('non opt'){largest_palindrome}
  # x.report('opt'){largest_palindrome_opt}
# end
#puts largest_palindrome
puts largest_palindrome_opt