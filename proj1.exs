[n, k] = System.argv |> Enum.map(&String.to_integer/1)

node1 = :"foo@192.168.0.13"
node2 = :"bar@192.168.0.13"

# registry is a genserver whose state is modified by other worker genservers
# the registry accumulates results from child genservers
{:ok, registry1} = :rpc.call(node1, Proj1.Registry, :start_link, [[]])
{:ok, registry2} = :rpc.call(node2, Proj1.Registry, :start_link, [[]])

# Boss is a genserver which spawns children genservers which in turn carry out the actual computation
# {:ok, boss1} = Proj1.Boss.start_link([])
{:ok, boss1} = :rpc.call(node1, Proj1.Boss, :start_link, [[]])
{:ok, boss2} = :rpc.call(node2, Proj1.Boss, :start_link, [[]])

mid = Float.ceil(n/2) |> :erlang.trunc

Proj1.Boss.spawn_children(boss1, 1..mid, k, registry1)
Proj1.Boss.spawn_children(boss2, (mid+1)..n, k, registry2)

# wait for both the bosses to end
:sys.get_state(boss1, :infinity)
:sys.get_state(boss2, :infinity)

# query the state of the registry to retrieve final result
IO.inspect :sys.get_state(registry1, :infinity) ++ :sys.get_state(registry2, :infinity)