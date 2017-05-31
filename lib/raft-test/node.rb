class Node
  attr_accessor :role
  def initialize(id)
    @node_id = id

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
end
