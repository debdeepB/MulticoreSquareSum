defmodule Proj1.Registry do
  use GenServer

  def start_link(stack) when is_list(stack) do
    GenServer.start_link(__MODULE__, stack)
  end

  def push(pid, result) do
    GenServer.call(pid, {:push, result})
  end

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call({:push, result}, _from, state) do
    {:reply, result, [result | state]}
  end
end