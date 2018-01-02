defmodule PeerToPeerElixirTest do
  use ExUnit.Case
  doctest PeerToPeerElixir

  test "greets the world" do
    assert PeerToPeerElixir.hello() == :world
  end
end
