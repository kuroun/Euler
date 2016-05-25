require './prime'
require 'benchmark'
#implement using lcm formula:
# http://math.stackexchange.com/questions/328478/find-smallest-multiple-of-specific-set-of-numbers
#prime algorithm:
def smallest_multiple_prime a,b
  arr = []
  (a..b).each do |i|
    if(prime?i)
      sum = i
      while(sum<=b) do
        sum *= i
      end
      sum /= i
      arr.push(sum)
    end
  end
  rs=1
  arr.map {|x| rs *= x }
  return rs
end
#my first try algorithm:
def prime_factor(h,n,m=2)
  if(m > n) 
    h[1] = 1
  else
    if(n%m==0)
      if(h.key?m)
        h[m] += 1
      else
        h[m] = 1
      end
      prime_factor(h, n/m,m)
    else
      prime_factor(h,n,m+1)
    end
  end
  h
end
def lcm a, b
  ha = {}
  hb = {}
  ha = prime_factor(ha,a)
  hb = prime_factor(hb,b)
  ha.each do |k,v|
    if(hb.key?k)
      if(hb[k]< v)
        hb[k] = v
      end
    else
      hb[k] = v
    end
  end
  sum = 1
  hb.map {|k,v| sum *= (k**v)}
  return sum
end
def smallest_multiple_recursive a, b
  if(a==b)
    lcm(a,1)
  else
    lcm(smallest_multiple_recursive(a,b-a),b)   
  end
end
Benchmark.bm(10) do |x|
  x.report('prime algorithm'){smallest_multiple_prime(1, 10)}
  x.report('recursive algorithm'){smallest_multiple_recursive(1, 10)}
end
puts smallest_multiple_prime 1,10
puts smallest_multiple_recursive 1,10
