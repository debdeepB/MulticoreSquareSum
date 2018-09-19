defmodule Proj1.Worker do
  use GenServer

  def start_link(_state) do
    GenServer.start_link(__MODULE__, [])
  end

  def run(pid, range, k, registry) do
    GenServer.cast(pid, {:run, range, k, registry})
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:run, range, k, registry}, state) do
    Runner.run(Enum.to_list(range), k, registry)
    {:noreply, state}
  end
end
