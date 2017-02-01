class Array
    def sum
        sum = 0
        if self == [] #self refers to the element accessing the method, in this case its an array
            return sum
        else
            self.each do |e|
                sum += e #sums each element
            end
        end
        return sum
    end
    
    def square
        new_arr = []
        if self == []
            return new_arr
        else
            self.each do |e|
                new_arr << e**2 #pushes the square of each element to a new array
            end
            return new_arr
        end
    end
    
    def square! #same as above but it only operates on self. so in this case the original array is mutated.
        if self == []
            return self
        else
            self.each_with_index do |e,i|
                self[i] = e**2
            end
            return self
        end
    end
end