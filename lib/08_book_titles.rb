class Book
# write your code here
    attr_accessor :title
    #typical setter
    # def title=(value)
    #    @title = value
    # end
    #SETTER. This overrides the default setter method that is provided via attr_accessor, and manipulates value given before setting it to @title.
    def title=(value) # defines setter
        exceptions = ['the','a','and','an','in','the','of']  #list of exceptions for capitlization as defined by test spec
        arr = value.split(' ')
        arr2 = arr.each.map do |e| 
            if (exceptions.include?(e)) #don't capitalize
                e = e.downcase 
            else
                e.capitalize
            end
        end
        arr2[0] = arr2[0].capitalize #make sure first word is always capitalized
        @title = arr2.join(' ') #finally set instance variable
    end
end
