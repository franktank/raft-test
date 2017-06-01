class Server
  def initialize(address)
    @timer = Timer.new
    @node = Node.new(address, timer)
  end
end

# Create timer here and send to node

class Timer
  def initialize
    # optimize number or let instantiation set numbers
    @min = 4, @max = 10
  end

  # Some time in the future
  def next
    Time.now + @min + Random.rand(@max - @min)
  end
end
