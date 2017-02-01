def measure(num = 1)
    start = Time.now #gets time before block is executed
    num.times do
        yield
    end
    result =(Time.now - start)/num #gets average of each runtime through the block
    return result
end