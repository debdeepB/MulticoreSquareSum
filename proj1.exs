[n, k, workers] = [10000, 289, 200]

subproblem_size = n/workers |> Float.ceil |> :erlang.trunc

subproblems = Enum.chunk_every(1..n, subproblem_size)

:erlang.statistics(:runtime)
:erlang.statistics(:wall_clock)

tasks = Enum.map subproblems, fn subproblem ->
  Task.async(fn -> Runner.run(subproblem, k) end)
end

result = Enum.reduce(tasks, [], fn (task, acc) -> Task.await(task) ++ acc  end )

{_, t1} = :erlang.statistics(:runtime)
{_, t2} = :erlang.statistics(:wall_clock)

IO.puts (t1/t2)

IO.inspect result







