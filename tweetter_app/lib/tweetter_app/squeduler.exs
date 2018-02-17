defmodule TweeterApp.Scheduler do
    def schedule_file_read(schedule, file) do
        Quantum.add_job(schedule, fn (_) -> TweeterApp.Reader.get_tweets_from_file(file) |> TweeterApp.Server.tweet end)
    end
    
end