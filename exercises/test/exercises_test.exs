defmodule ExercisesTest do
  use ExUnit.Case

  test "two sum correctly finds the elements" do
    sums1 = Exercises.two_sum([1,2,3], 0)
    sums2 = Exercises.two_sum([1,2,3,4,-4], 0)
    sums3 = Exercises.two_sum([1,2,3,4,5], 6)
    sums4 = Exercises.two_sum([1,2,3], 1)
    sums5 = Exercises.two_sum([1,2,3], 4)

    assert sums1 == []
    assert sums2 == [3,4]
    assert sums3 == [0,4]
    assert sums4 == []
    assert sums5 == [0,2]
  end
end
