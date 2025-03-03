## Formatting

### JuliaFormatter.jl
We use [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl) for formatting and recommend you to install it in your global environment:

```julia-repl
julia> # Press ]
pkg> activate
pkg> add JuliaFormatter
```

### Beware of reviewdog 🐶
We use the [julia-format](https://github.com/julia-actions/julia-format) Github action to ensure that the code follows the formatting rules defined by [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl).
When opening a pull request [reviewdog](https://github.com/reviewdog/reviewdog) will automatically make formatting suggestions for your code.

Written by **Judith Schepers**.