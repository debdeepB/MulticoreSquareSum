[n, k] = System.argv |> Enum.map(&String.to_integer/1)

midpoint = Float.ceil(n/2) |> :erlang.trunc

{:ok, pid} = Proj1.Registry.start_link([])

tasks_1 = M.main(1..midpoint, k, :"foo@Debdeeps-MacBook-Air.local", pid)

tasks_2 = M.main((midpoint+1)..n, k, :"bar@Debdeeps-MacBook-Air.local", pid)

tasks = tasks_1 ++ tasks_2

Enum.each tasks, fn task ->
  Task.await(task, :infinity)
end

IO.inspect :sys.get_state(pid)
