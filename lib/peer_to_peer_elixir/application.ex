defmodule PeerToPeerElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    config = Application.get_env(:peer_to_peer_elixir, :server)

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: PeerToPeerElixir.Worker.start_link(arg)
      # {PeerToPeerElixir.Worker, arg},
      {PeerToPeerElixir.Server, config}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PeerToPeerElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
