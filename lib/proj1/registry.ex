defmodule Proj1.Registry do
  use GenServer

  def start_link(stack) when is_list(stack) do
    GenServer.start_link(__MODULE__, stack)
  end

  def push(pid, result) do
    GenServer.cast(pid, {:push, result})
  end

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_cast({:push, result}, state) do
    {:noreply, [result | state]}
  end
end