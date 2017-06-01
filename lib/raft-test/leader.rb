class Leader
  def initialize(node)
    @node = node
    @next_entries = Hash[node.all_servers.map { |s| [s, 1] }] # next entry to send
    @match_indices = Hash[node.all_servers.map { |s| [s, 0] }]# used to calculate commit_index
  end
end
