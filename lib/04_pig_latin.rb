def translate(words)
    consonants = [*('b'..'d'), *('f'..'h'), *('j'..'n'), *('p'..'t'), *('v'..'z')] #uses splat operator to flatten ranges of consonant characters into the array
    vowels = ['a','e','i','o','u']
    word_array = words.split(' ') #splits string at the space,  to accept multiple words
    word_array.each_with_index do |e, i|
        consonant_counter = 0 #count how many consonants in a row there are, so we know how many characters to trim from the start of the word
        capitalized = (e[0] == e[0].upcase) #checks to see if first letter of word was capitalized so we can retain this at the end
        special = '' #used to store any special character/punctuation
        if((!consonants.include?(e[-1])) && !vowels.include?(e[-1])) #if character is not in the consonants or vowel array, then we slice it and store it in special variable
            special += e[-1]
            e.slice!(-1)
        end
        e.chars.each_index do |index|
            e[index] = e[index].downcase #makes sure words are lower case
            if(consonants.include?(e[index]))
                e << e[index] #if consonant, push to end of word
                consonant_counter += 1
            elsif(e[index-1] == ('q') && e[index] == ('u')) #if the previous letter was a q and the current is a u, we act as if the u is a consonant and push it, but we break after this letter 
                e << e[index]
                consonant_counter += 1
                break
            elsif(vowels.include?(e[index]))  #if its a vowel, we break out of the loop because we keep vowels at start of word
                break
            end
        end
        e += 'ay' + special #adds 'ay' and  special charatcer, if any, to end of word
        word_array[i] = e[consonant_counter..-1] #we set the word to start from the last consonant, if any, to the last letter
        if(capitalized)
            word_array[i].capitalize! #if the word was initially capitalized, we now recapitalize the word with the new starting letter
        end
    end
    result = word_array.join(' ') #make it a string again
    return result
end

