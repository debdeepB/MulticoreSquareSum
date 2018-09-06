[n, k] = System.argv |> Enum.map(&String.to_integer/1)

workers = 500

subproblem_size = n/workers |> Float.ceil |> :erlang.trunc

subproblems = Enum.chunk_every(1..n, subproblem_size)

:erlang.statistics(:runtime)
:erlang.statistics(:wall_clock)

{:ok, registry} = Proj1.Registry.start_link([])

tasks = Enum.map subproblems, fn subproblem ->
  Task.async(fn -> Runner.run(subproblem, k, registry) end)
end

Enum.each tasks, fn task ->
  Task.await(task, :infinity)
end

#get the results
IO.inspect :sys.get_state(registry)

{_, t1} = :erlang.statistics(:runtime)
{_, t2} = :erlang.statistics(:wall_clock)

IO.puts (t1/t2)