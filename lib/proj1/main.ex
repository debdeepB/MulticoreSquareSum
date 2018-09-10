defmodule M do
  def main(n, k) do
    {:ok, registry} = Proj1.Registry.start_link([])
    {:ok, boss} = Proj1.Boss.start_link([])

    Proj1.Boss.spawn_children(boss, 1..n, k, registry)

    # wait for the boss to end
    :sys.get_state(boss, :infinity)

    IO.inspect(:sys.get_state(registry))
  end
end
