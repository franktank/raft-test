class Follower
  def initialize(node)
    @node = node
  end

  # Followers can request a vote if timeout
  # Leaders can send request for follower to append an entry to log
end
