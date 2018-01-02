defmodule PeerToPeerElixir.Server do
  @moduledoc """
  A simple TCP Server
  """

  use GenServer

  alias PeerToPeerElixir.Handler

  require Logger

  @doc """
  Starts da server
  """
  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  @doc """
  Initiates da listener (pool of acceptors)
  """
  def init(port: port) do
    opts = [{:port, port}]
    {:ok, pid} = :ranch.start_listener(:peer_to_peer_elixir, :ranch_tcp, opts, Handler, [])
    Logger.info(fn ->
      "Listening for connections on port #{port}"
    end)
    {:ok, pid}
  end
end
