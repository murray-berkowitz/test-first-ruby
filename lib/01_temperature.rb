def ftoc(num)
    result = (num - 32)*(5/9.to_f) #using to_f method so that 5/9 doesn't round down to 0
    return result
end

def ctof(num)
    result = (num*1.8+32)
    return result
end