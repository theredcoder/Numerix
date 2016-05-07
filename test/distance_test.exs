defmodule Numerix.DistanceTest do
  use ExUnit.Case, async: false
  use ExCheck
  alias Numerix.Distance
  alias Numerix.Correlation

  property :pearson_distance_is_the_inverse_of_its_correlation do
    for_all {xs, ys} in {non_empty(list(int)), non_empty(list(int))} do
      {xs, ys} = ListHelper.equalize_length(xs, ys)
      Distance.pearson(xs, ys) == 1.0 - Correlation.pearson(xs, ys)
    end
  end

  property :pearson_distance_is_between_0_and_2 do
    for_all {xs, ys} in {non_empty(list(int)), non_empty(list(int))} do
      {xs, ys} = ListHelper.equalize_length(xs, ys)
      distance = Distance.pearson(xs, ys)
      distance >= 0 and distance <= 2
    end
  end

end