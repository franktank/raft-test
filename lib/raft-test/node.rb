class Node
  attr_accessor :role, :timer
  def initialize(addr, timer, cluster)
    @timer = timer
    @node_addr = addr
    @cluster = cluster

    # update on stable storage before responding to RPCs
    @current_term = 0
    @voted_for = nil
    @log = []

    # volatile for all nodes
    # index of highest log entry known to be committed
    @commit_index = 0
    # index of highest log entry applied to state machine
    @last_applied = 0

    @role = Follower.new(self)
  end

  # Method to check to see if request term is greater than current term,
  # If so update the current term, role to follower, voted_for to nil


end
