[n, k] = System.argv |> Enum.map(&String.to_integer/1)

# registry is a genserver whose state is modified by other worker genservers
# the registry accumulates results from child genservers
{:ok, registry} = Proj1.Registry.start_link([])

# Boss is a genserver which spawns children genservers which in turn carry out the actual computation
{:ok, boss} = Proj1.Boss.start_link([])
Proj1.Boss.spawn_children(boss, 1..n, k, registry)

# wait for the boss to end
:sys.get_state(boss, :infinity)

# query the state of the registry to retrieve final result
IO.inspect :sys.get_state(registry)