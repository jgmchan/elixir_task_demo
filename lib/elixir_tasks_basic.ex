defmodule ElixirTasks.Basic do
  def do_work(num) do
    before = DateTime.utc_now()
    IO.puts("Processing task #{num}")
    Process.sleep(50)
    DateTime.diff(DateTime.utc_now(), before, :microseconds) / 1_000_000
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
end
