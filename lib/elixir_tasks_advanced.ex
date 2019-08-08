defmodule ElixirTasks.Advanced do
  def do_work(num) do
    before = DateTime.utc_now()
    cpu_guzzling_work()
    DateTime.diff(DateTime.utc_now(), before, :microseconds) / 1_000_000
  end

  defp cpu_guzzling_work() do
    1..30000
    |> Enum.reduce(fn x, acc ->
      acc * x
    end)
  end

  def simple_map(items) do
    Enum.map(1..items, &do_work/1)
  end

  def simple_task(items) do
    tasks =
      for item <- 1..items do
        Task.async(fn -> do_work(item) end)
      end

    tasks
    |> Task.yield_many(15000)
    |> Enum.map(fn {_task, {:ok, result}} -> result end)
  end

  def average_time(times) do
    Enum.sum(times) / length(times)
  end

  def measure(func, items) do
    before = DateTime.utc_now()
    result = func.(items)
    total_time = DateTime.diff(DateTime.utc_now(), before, :microseconds) / 1_000_000

    IO.puts("RESULTS: #{inspect(result)}\n")
    IO.puts("TOTAL TIME: #{total_time}\n")
    IO.puts("AVERAGE TIME: #{average_time(result)}\n")
  end
end
