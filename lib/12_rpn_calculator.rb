class RPNCalculator
    attr_accessor :calculator, :value
    def initialize #intializes calculator to empty, return value to 0
        @calculator = []
        @value = 0
    end
    def clear #optional method to clear value on calculator
        @value = 0
    end
    def push(num) #self defined push, uses shovel operator to add to end of array
        @calculator << num
    end
    def plus
        container = [] #uses this container to store the values to operate on
        if calculator.length < 2 #raises exception if not enough numbers to work with
            raise "calculator is empty"
        else
            container << calculator.pop #pops twice, adding only the last two elements of our calculator array to our container 
            container << calculator.pop
            @value = container[0] + container[1] #add the values in our container
            @calculator << @value #push that new value back to our calculator for further operations
        end
        return @value
    end
    #same as plus method, except this time for minus, divide, multiply
    def minus
        container = []
        if calculator.length < 2
            raise "calculator is empty"
        else
            container << calculator.pop
            container << calculator.pop
            @value = container[1] - container[0]
            @calculator << @value
        end
        return @value
    end
    def divide
        container = []
        if calculator.length < 2
            raise "calculator is empty"
        else
            container << calculator.pop
            container << calculator.pop
            @value = container[1].to_f / container[0]
            @calculator << @value
        end
        return @value
    end
    def times
        container = []
        if calculator.length < 2
            raise "calculator is empty"
        else
            container << calculator.pop
            container << calculator.pop
            @value = container[0].to_f * container[1]
            @calculator << @value
        end
        return @value
    end
    def tokens(string)
        tokens = ['+','-','/','*']  #array of token matches
        arr = string.split(' ') #split string
        arr.each_with_index do |e,i|
            if (tokens.include?(e)) #check if current element is a matching token, and if so convert to symbol
                arr[i] = e.to_sym
            else #otherwise just convert to integer 
                arr[i] = e.to_i
            end
        end
        return arr
    end
    def evaluate(string)
        string = tokens(string) #uses aforementioned tokens function
        string.each do |e| #checks if current element is a symbol, if so perform associated method. otherwisem push to @calculator array
            if(e == :+)
                plus
            elsif (e == :-)
                minus
            elsif (e == :/)
                divide
            elsif (e == :*)
                times
            else
                @calculator.push(e)
            end
        end
        return @value
    end
end

