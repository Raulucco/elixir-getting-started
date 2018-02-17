defmodule TweetterApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: TweetterApp.Worker.start_link(arg)
      {TweetterApp.Server, _},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TweetterApp.Supervisor]
    process = Supervisor.start_link(children, opts)
    TweetterApp.Schedule.schedule_file_read(
      "* * * * *",
      Path.join("#{:code.priv_dir(:tweeter_app)}", "tweets_file.txt")
    )
    process
  end
end
