def raft
  # Appendix B
  # Constants
  # Server IDs
  # Request values
  # States - Follower, Candidate, Leader
  # 4 message types - RequestVoteRequest, RequestVoteResponse
  # AppendEntriesRequest, AppendEntriesResponse



  ######### Per server needs to have ##########
  ### Server Vars
  # current_term - server's term number
  # state - Follower, Candidate, or Leader
  # voted_for - candidate the server voted for in current term, or nil

  ### Log Vars ###
  # log - sequence of log entries, something important about the entry with index 1
  # commit_index - index of the latest log entry

  ##### Candidate Variables ######
  # votes_responded - set of servers from which candidate has received a RequestVote response in its current term
  # votes_granted - set of servers from which the candidate has received a vote in its current term


  ##### Leader Variables #####
  # next_index - next entry to send to followers
  # match_index - latest entry that each follower has acknowledged is the same as the leader's, used to calculate commit_index

  ##### Variables used for stuttering #####
  # messages, allLogs, serverVars, candidateVars, leaderVars, logVars

  ##### Helpers #####
  # quorum - i is subset of server, cardinality(i)*2 > cardinality(server)
  # last_term(xlog) - if len(xlog) == 0 then 0, else xlog[len(xlog)].term
  # with_message(m, msgs) - given a msg m and bag of messages, return a new bag of messages with one more m in it
  # without_message(m, msgs) - give a msg m and bag of messages, return a new bag of messages with one less m in it
  # send(m) - add msg to bag of messages
  # discard(m) - remove a msg from bag of messages, used after msg is processed
  # reply(response, request)
  # min(s) - min value from a set
  # max(s) - max value from a set


  #####Initial Values #####
  # election = {}, all_logs = {}, voter_log = [i element server  → [j ∈ {}  → ⟨⟩]]]
  # current_term = {i element server, -> 1}, state = follower, voted_for = nil
  # votes_responded = {}, voted_granted = {},
  # next_index = 1, match_index = 0
  # log = [], commit_index = 0
  # messages = []

  ##### State Transitions #####
  # restart(i) - loses all but current_term, voted_for, and log
  # timeout(i) - starts new election
  # request(i, j) - candidate i sends j a RequestVote request
  # append_entries(i, j) - leader i send j an append_entries request, containing up to 1 entry. implementations maybe able to send more than 1 at time
  # become_leader(i) - candidate i transitions to leader
  # client_request(i, v) - leader i receieves a client request to add v to log
  # advance_commit_index(i) - leader i advances commit_index, separate step from handling append_entries response, allow leaders to mark entries committed


  ##### Message handlers #####
  # i = recipient, j = sender, m = message
  # handle_request_vote_request(i,j,m) - server i receieves a request_vote request from server j with m.mterm < current_term[i].
  # handle_request_vote_response(i,j,m) - server i receives a request_vote response from server j with m.mterm = current_term[i]
  # handle_append_entries_request(i,j,m) - server i receieves an append_entries request from server j with m.mterm <= current_term[i]. handles m.entries of length 1 or 0, but implementations could safely accept more by treating them same as multiple independent requests of 1 entry
  # handle_append_entries_response(i,j,m) - server i receieves an append_entries response from server j with m.mterm = current_term[i
  # update_term - any RPC with a newer term causes the recipient to advance its term first
  # drop_stale_response(i,j,m) - responses with stale terms are ignored
  # receive(m) - receive a message

  ##### Network state transitions #####
  # duplicate_message(m) - networks duplicates a message
  # drop_message(m) - network drops a message

  ##### Defines how variables may transition #####
  # next - ???
  # spec - ??? -> start with initial state and transition according to next
end
