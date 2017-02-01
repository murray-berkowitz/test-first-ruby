def reverser
    arr = yield.split(' ') #yields to block and splits at the space
    arr.each do |e|
        e.reverse! #reverses each word permanently
    end
    return arr.join(' ') #returns as string
end

def adder(add = 1)
    return yield + add #by default will add 1 to whatever number is passed in block unless another number is passed to method
end

def repeater(times = 1)
    times.times do #will execute block as many times as specified, by default one time
         yield
    end
end