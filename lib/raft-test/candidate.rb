class Candidate
  def initialize(node)
    @votes_responded = [] # set
    @votes_granted = []
    @node = node

    @election_timeout = node.timer.next

    send_vote_requests
  end

  def send_vote_requests

  end
end
