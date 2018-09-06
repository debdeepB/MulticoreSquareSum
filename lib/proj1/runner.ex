defmodule Runner do
  def run(list, len) do
    result = Enum.filter list, fn starting_point -> search(starting_point, len) end
    result
  end

  defp search(starting_point, len) do
    #start squaring numbers and summing them up
    range = starting_point..(starting_point + len - 1)
    sum = Enum.reduce(range, 0, fn (x, acc) -> x*x + acc end )
    is_perfect_square?(sum)
  end

  defp is_perfect_square?(n) do
    :math.sqrt(n) |> :erlang.trunc |> :math.pow(2) == n
  end
end