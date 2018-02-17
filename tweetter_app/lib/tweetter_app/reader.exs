defmodule TweeterApp.Reader do
    def get_tweets_from_file(path) do
        File.read!(path)
        |> String.split("\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 140)
        |> Enum.random()
    end
end