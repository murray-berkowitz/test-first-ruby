def add(a,b)
    return a+b
end

def subtract(a,b)
    return a-b
end

def sum(arr)
    total = 0 #intialize total to 0
    if (arr == [])  #checks for empty array
        total = 0
    else
        arr.each do |e| #loops through array, adding each element to total
            total+=e
        end
    end
    return total
end

def multiply(*args) #The * character tells our method that we don't  know how many arguments will be passed into it. This way code works for several  numbers
    total = 1 #initialize to 1 since multiplication
    args.each do |e|
        total *= e
    end
    return total
end

def power(a,b) 
    result = a ** b
    return result
end

def factorial(a)
    result = 1
    if a == 0 
        result = 0
    else
        2.upto(a) do |e| #multiplies each number  up to and including 'a'
            result *= e
        end
    end
    return result
end