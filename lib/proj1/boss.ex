defmodule Proj1.Boss do
  use GenServer

  def start_link(_state) do
    GenServer.start_link(__MODULE__, [])
  end

  def spawn_children(pid, range, k, registry) do
    GenServer.cast(pid, {:spawn_children, range, k, registry})
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:spawn_children, range, k, registry}, state) do

    workers = 10000
    
    subproblem_size = Enum.count(range)/workers |> Float.ceil |> :erlang.trunc

    subproblems = Enum.chunk_every(range, subproblem_size)

    workers = Enum.map subproblems, fn subproblem ->
      {:ok, pid} = Proj1.Worker.start_link([])
      Proj1.Worker.run(pid, subproblem, k, registry) #async call
      pid
    end

    Enum.map workers, fn worker ->
      :sys.get_state(worker)
    end
    
    {:noreply, state}
  end
end
