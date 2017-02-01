class Dictionary
  attr_accessor :entries, :keywords
  def initialize(entry = Hash.new(nil)) #options hash to intialize dictionary, by default values are set to nil unless said otherwise
      @entries = entry
      @keywords = entry.keys
  end
    
  def add(hash) 
    if(hash.class == Hash)              #checks if passed value is indeed a Hash, if so add each key/value pair to @entries
          hash.each_pair do |key,value|
              @entries[key] = value
          end
    else  #otherise, add string to  @entries with value of nil
        @entries[hash] = nil
    end
    @keywords = @entries.keys.sort #recreates our @keywords variable with newly minted keys. sorts them as well
  end
  
  def include?(key) 
      if @keywords.include?(key)
          return true
      else
          return false
      end
  end
  
  def find(key) #creates empty hash to store search results. if current key includes search string, add it to the results hash
      search_result = {}
      @entries.each_pair do |k, value|
          if(k.include?(key))
              search_result[k] = value
          end
      end
      return search_result
  end
  
  def printable
      result = ""
      sorted = @entries.sort_by{|key, value| key} #this sorts our @entries hash into a 2 dimensional array. we loop through and add output to result string
      sorted.each_with_index do |e,i|
          result += "\[#{e[0]}\] \"#{e[1]}\""
          if(i != sorted.length-1) #the last pair doesn't get a new line, so check if we are at end of array or not
              result+= "\n"
          end
      end
      return result
  end
end
