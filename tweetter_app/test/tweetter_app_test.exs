defmodule TweetterAppTest do
  use ExUnit.Case
  doctest TweetterApp

  test "greets the world" do
    assert TweetterApp.hello() == :world
  end
end
