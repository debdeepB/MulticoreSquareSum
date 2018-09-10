[n, k] = System.argv |> Enum.map(&String.to_integer/1)

workers = 100

subproblem_size = n/workers |> Float.ceil |> :erlang.trunc

subproblems = Enum.chunk_every(1..n, subproblem_size)

tasks = Enum.map subproblems, fn subproblem ->
  Task.Supervisor.async(Proj1.TaskSupervisor, fn -> Runner.run(subproblem, k, Proj1.Registry) end)
end

Enum.each tasks, fn task ->
  Task.await(task, :infinity)
end

IO.inspect :sys.get_state(Proj1.Registry)