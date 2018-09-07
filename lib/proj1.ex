defmodule Proj1 do
  use Application

  def start(_type, _args) do
    Proj1.Supervisor.start_link(name: Proj1.Supervisor)
  end
end
