defmodule Riverarte.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Riverarte.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Riverarte.PubSub}
      # Start a worker by calling: Riverarte.Worker.start_link(arg)
      # {Riverarte.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Riverarte.Supervisor)
  end
end
