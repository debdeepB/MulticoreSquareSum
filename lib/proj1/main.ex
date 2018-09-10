defmodule M do
  def main(range, k, hostname, pid) do
    workers = 100

    subproblem_size = Enum.count(range)/workers |> Float.ceil |> :erlang.trunc

    subproblems = Enum.chunk_every(range, subproblem_size)

    tasks = Enum.map subproblems, fn subproblem ->
      Task.Supervisor.async({Proj1.TaskSupervisor, hostname}, fn -> Runner.run(subproblem, k, pid) end)
    end

    tasks

  end
end