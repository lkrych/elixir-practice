defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.

  Create a unique identicon for any given string.
  
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  #pattern match off of argument list!
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail ]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  # you need to pass a reference to mirror_row,
  # passing mirror_row without an ampersand would immediately invoke the function
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = 
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten 
      |> Enum.with_index

    %Identicon.Image{ image | grid: grid}
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({val, _index}) -> 
      rem(val, 2) == 0 
    end
    %Identicon.Image{ image | grid: grid}
  end

end
