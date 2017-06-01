class Node
  attr_accessor :state, :timer
  def initialize(id, addr, timer, all_servers)
    @timer = timer
    @node_addr = addr
    @all_servers = all_servers # currently just [] of server ids

    # update on stable storage before responding to RPCs
    @current_term = 0
    @voted_for = nil


    @log = [] # log var

    # volatile for all nodes
    # index of highest log entry known to be committed
    @commit_index = 0 # log var
    # index of highest log entry applied to state machine
    @last_applied = 0

    @state = Follower.new(self)
  end

  # Method to check to see if request term is greater than current term,
  # If so update the current term, role to follower, voted_for to nil


end
