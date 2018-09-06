[n, k, workers] = [10000, 289, 4]

subproblem_size = n/workers |> Float.ceil |> :erlang.trunc

subproblems = Enum.chunk_every(1..n, subproblem_size)

tasks = Enum.map subproblems, fn subproblem ->
  Task.async(fn -> Runner.run(subproblem, k) end)
end

result = Enum.reduce(tasks, [], fn (task, acc) -> Task.await(task) ++ acc  end )

IO.inspect result







