class Server
  def initialize(node_id ,address, cluster)
    # address and node_id come from cluster, will iterate through the cluster to get these
    # cluster is hash, key node_id, value address
    @timer = Timer.new
    @node = Node.new(address, timer, cluster)
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
