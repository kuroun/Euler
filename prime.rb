# Your code here
def prime? val
    if(val <= 1) then return false
    else 
        for i in 2..Math.sqrt(val)
            if(val % i == 0) then 
                return false
            end
        end
    end 
    return true 
end
puts prime? 18
