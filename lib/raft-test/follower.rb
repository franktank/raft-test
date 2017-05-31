class Follower
  def initialize(node)
    @node = node
  end

  # Leaders can send request for follower to vote for them
  def request_vote(ct, cid, llidx, llt)
    # ct is candidate's term
    # cid is the requesting candidate's id
    # llidx is index of the candidate's last log entry
    # llt is the term of candidate's last log entry

    # need a voted_for, check to see if null or has the candidate id already
    # in node?
    if is_valid_vote_request?(ct, cid, llidx, llt)
      node.voted_for = cid
      # need to update a node's log, log_entries, current_term, voted_for, cluster?
      # persistent stuff -> Figure 3.1 current_term, voted_for, and log

      term = node.current_term
      vote_granted = true
    else
      term = node.current_term
      voted_granted = false
    end
    return term, vote_granted
  end

  def is_valid_vote_request?(ct, cid, llidx, llt)
    # false if term < current term

    # votedFor is null or candidateId,
    # and candidate's log is at least as up-to-date as receiver's log,
    # grant vote

    # need a voted_for, check to see if null or has the candidate id already
    # in node?

    return false if ct < node.current_term
    # if node.voted for is not nil, then it needs to be the cid
    return false if node.voted_for != nil && node.voted_for != cid
    # need to check last log term, and last log index with the current node's log

  end

  # Leaders can send request for follower to append an entry to log
  def append_entries
  end
end
