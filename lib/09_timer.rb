class Timer
  #write your code here
    attr_accessor :seconds #allows both setting and getting of instance variable
    def initialize(seconds = 0) #defines initialize method to initialize our instance variable. equals 0 if no number is provided
        @seconds = seconds
    end
    #METHOD
    def padded(number)  #defines helper method to pad numbers less than 10
        if(number < 10)    
            number = "0"+number.to_s
        end
        return number.to_s
    end
    def time_string
        if(seconds < 60) #if number is less than 60, all we do is use the padded method and add to end of time string
            time = "00:00:" + padded(seconds)
            return time
        else
            hour = 0
            min = 0
            new_seconds = seconds
            time = ""
            while new_seconds >= 60 #while seconds is greater than 60, we subtract until it is less than 60. With each pass, we add 1 minute to the minute counter, and the remainder is our final seconds value
                new_seconds -= 60
                min += 1
            end
            while min >= 60 #same as above, except we add 1 to hours while minutes are greater than 60
                min -= 60
                hour += 1
            end
            #here we add our padded hours,minutes, and seconds values to our time string
            time += padded(hour) + ':' 
            time += padded(min) + ':'
            time += padded(new_seconds)
        end
        return time
    end
end

