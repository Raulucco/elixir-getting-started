defmodule TweetterApp.Tweet do
    def send(str) do
        ExTwitter.config(
            :process,
            [
                consumer_keys: System.get_env("consumer_key"),
                consumer_secret: System.get_env("consumer_secret"),
                access_token: System.get_env("access_token"),
                access_secret: System.get_env("access_token")
            ]
        )

        ExTwitter.update(str)
    end
    
    def send_random(file) do
        TweetterApp.Reader.get_tweets_from_file(file)
        |> send
    end
end