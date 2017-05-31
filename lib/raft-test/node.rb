class Node
  def initialize(id, )
    @node_id = id
    @current_term = 0
    @role = Follower.new(self)
  end
end
