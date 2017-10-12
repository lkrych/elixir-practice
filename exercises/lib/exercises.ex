defmodule Exercises do
  def two_sum(arr, to_find) do
    Enum.with_index(arr) |>
    Enum.reduce_while([], fn {x,i},acc ->
      y = to_find - x
      case Enum.find_index(arr, &(&1 == y)) do
        nil -> {:cont, acc}
        j   -> {:halt, [i,j]}
      end
    end)
  end
end
