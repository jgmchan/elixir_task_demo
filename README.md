# ElixirTasks

Code used for my talk at [Elixir Sydney Meetup - 8th August 2019](https://www.meetup.com/en-AU/elixir-sydney/events/qfdzcryzlbkb/)

## Modules

### ElixirTasks.Basic
This contains the examples where the work being done is just sleeping for 50ms.

```
# Run the implementation of using `Enum.map`
ElixirTasks.Basic.simple_map(50)

# Run the implementation of using `Task.async`
ElixirTasks.Basic.simple_task(50)
```

### ElixirTasks.Advanced
This contains the examples where the work is actually something that consumes the CPU.
Will also print out a summary of the time it takes to run.

```
# Run the implementation of using `Enum.map`
ElixirTasks.Advanced.measure(&ElixirTasks.Advanced.simple_map/1, 50)

# Run the implementation of using `Task.async`
ElixirTasks.Advanced.measure(&ElixirTasks.Advanced.simple_task/1, 50)
```
