defmodule Proj1.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      {Proj1.Registry, name: Proj1.Registry}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end
end
