class Friend
  # TODO: your code goes here!
  def greeting(name = nil) 
      if(name != nil) #if a name is provided, do the following
          return "Hello, #{name}!"
      else
          return "Hello!"
      end
  end
end
