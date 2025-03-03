## Testing

As with most Julia packages, you can just open Julia in the repository folder, activate the environment, and run `test`:

```julia-repl
julia> # press ]
pkg> activate .
pkg> test
```

!!! tip "Running single tests"
    Instead of running all tests, you can also run the `test/setup.jl` to load all required packages, and subsequently run single tests manually either by `include("test/my_test.jl")` or by opening the file and running the specific test block you want to run.

Written by **Judith Schepers**.