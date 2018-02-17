defmodule TweeterApp.Server do
    use GenSever

    def init(:ok) do
        {:ok, %{}}
    end

    def start_link() do
        GenSever.start_link(__MODULE__, :ok, name: :tweet_server)
    end

    def handle_cast({:tweet, tweet}, _) do
        TweeterApp.Tweet.send(tweet)
        {:noreplay, %{}}
    end

    def tweet(tweet) do
        GenSever.cast(:tweet_server, {:tweet, tweet})
    end
end