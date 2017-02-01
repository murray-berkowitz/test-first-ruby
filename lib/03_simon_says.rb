def echo(word)
    return word
end

def shout(words)
    return words.upcase 
end

def repeat(word,times = 2)
    result = [word] * times * ' ' #converts word/string to array, multiplies array by amount of times specified, then multiplies by a space ' ', which is pretty much a shortcut for .join(' ') to convert back to string.
    return result
end

def start_of_word(word, start = 1)
    result = "" #initialize empty string
    start.times do |i|  #repeat amount of times specified, or  1 time by default
        result += word[i] #add character at current index to result
    end
    return result
end

def first_word(string)
    result = string.split(' ') #splits string into an array at the spaces
    return result[0] #returns first element in the array
end

def titleize(word)
    little_words = ['a','and','the','over','in','an','but'] #list of little words 
    if(word.include? ' ') #checks if its a multi word string
        arr = word.split 
        arr2 = arr.each_with_index.map do |e, index| #maps results of block to arr2 variable
            if((index != 0 && index != arr.length-1) && little_words.include?(e))  #Confirms that if the current word is indeed a little word, it is not placed at the beginning or end of the title
                e.downcase
            else
                e.capitalize
            end
        end
        result = arr2.join(' ') #converts back to string with appropriate spaces
    else
        result = word.capitalize #capitalize every other word
    end
    return result
end




