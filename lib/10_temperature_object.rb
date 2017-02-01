class Temperature
  attr_accessor :celsius, :fahrenheit #provides both getter and setter methods for these instance variables
    
  def initialize(temps = {}) #allows construction with an options hash, then initializes temps accordingly
      @celsius = temps[:c]   
      @fahrenheit = temps[:f]
  end
    
  class << self                #begins definition of class methods
     
     #from_fahrenheit and from_celsius are factory methods, which essentially provide more specific and potentially less convoluted ways to initialize an instance of a class. They are class methods, so you use them directly on the parent class
     def from_fahrenheit(num)
         self.new(:f => num)
     end
      
     def from_celsius(num)
         self.new(:c => num)
     end
    #define helper methods to the class for refactoring  
     def ctof(num)
        return (num*1.8) + 32
     end
      
     def ftoc(num)
         return (num - 32)*(5/9.to_f)
     end
  end
    
  def in_fahrenheit
      if(@fahrenheit != nil) #if fahrenheit already given, just return fahrenheit
          return @fahrenheit
      else
          @fahrenheit = self.class.ctof(@celsius) #call the class method for converion
          return @fahrenheit
      end
  end
    
  def in_celsius
      if(@celsius != nil) #same as above, but for celsius
          return @celsius
      else
          @celsius = self.class.ftoc(@fahrenheit)
          return @celsius
      end
  end
end

class Celsius < Temperature #create child class of Temperature,which handles conversions to fahrenheit
    attr_accessor :celsius
    def initialize(num)
        @celsius = num
    end
    def in_fahrenheit
        return self.class.ctof(@celsius)
    end
    def in_celsius
        return @celsius
    end
end

class Fahrenheit < Temperature #child class which handles converions to celsius
    attr_accessor :fahrenheit
    def initialize(num)
        @fahrenheit = num
    end
    def in_fahrenheit
        return @fahrenheit
    end
    def in_celsius
        return self.class.ftoc(@fahrenheit)
    end
end




