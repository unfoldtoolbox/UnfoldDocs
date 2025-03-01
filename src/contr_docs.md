## Documentation

Documentation is key to maintaining a codebase that is easy to understand and extend.
Whether it is comments in the code, docstrings, or tutorials, when writing documentation,
 think about your future self or the next person reading the code or using your functions.

### Building and viewing the documentation locally

We recommend using [LiveServer.jl](https://github.com/JuliaDocs/LiveServer.jl) to build and preview the documentation locally.
To simplify this process we created the `docs/run_liveserver.jl` script.

Please follow these steps:

1. Navigate to the `docs` folder and activate it.
2. Run `using Revise` (in case you decided to install it in your docs environment).
3. If this is the first time building the docs
   1. Press `]` to enter `pkg` mode.
   2. Run `pkg> dev ..` to use the development version of your package.
   3. Press backspace to leave `pkg` mode.
4. Run `include("run_liveserver.jl")`.
5. Click on the provided link or go to `http://0.0.0.0:8000/` in your browser.

!!! tip "Live preview of docstrings"
    Install `Revise.jl` in the docs environment to enable live updating of docstrings in the docs preview.

!!! tip "Separate Julia session for docs preview"
    We recommend using a separate Julia session (in VSCode) to run the `run_liveserver.jl` script, as it continues running. This way, you can avoid "blocking" the REPL and run other code in the meantime.

### Adding a documentation page
1. We recommend to write a Literate.jl document and place it in `docs/literate/FOLDER/FILENAME.jl` with `FOLDER` being `HowTo`, `Explanation`, `Tutorial` or `Reference` ([recommended reading on the 4 categories](https://documentation.divio.com/)).
2. Literate.jl converts the `.jl` file to a `.md` automatically and places it in `docs/src/generated/FOLDER/FILENAME.md`.
3. Edit [make.jl](https://github.com/unfoldtoolbox/Unfold.jl/blob/main/docs/make.jl) with a reference to `docs/src/generated/FOLDER/FILENAME.md`.

### Docstring templates
The following docstring templates are mainly based on the [Julia manual](https://docs.julialang.org/en/v1/manual/documentation/) and [Blue: a Style Guide for Julia](https://github.com/JuliaDiff/BlueStyle?tab=readme-ov-file#documentation).

#### Function docstring template
````julia
"""
    my_function(argument1:Type1; keyword_argument3::Type3 = value3)
    my_function(argument1::Type1, optional_argument2::Type2; keyword_argument3::Type3 = value3)

One-line description using the imperative form ("Do this") instead of the third person and ending with a period.

If the one-line description is not sufficient, one can also write a short paragraph with additional information.

# Arguments (if needed)
- `argument1::Type1`: Description of argument1.
- `optional_argument2::Type2` (optional): Description of optional_argument2.

# Keyword arguments (if needed)
- `keyword_argument3::Type3 = value3`: Description of keyword_argument3.

# Returns
- `result::Type4` : Description of result.

# Examples
```julia-repl
julia> my_function(value1, value2)
result1

julia> my_function(value1; keyword_argument3 = value4)
result2
```

See also [`my_function2`](@ref), [`my_function3`](@ref).
"""
````
**Special cases:**
- If a function accepts many keyword arguments, only include `<keyword arguments>` as a placeholder in the signature and give a keyword list with descriptions in the Keyword arguments section of the docstring.
- If a function returns more than one variable, write the Returns section in the following way:
  ```julia
  # Returns
  - (result1, result2)::Tuple{Type1, Type2}:
      - Description of result1
      - Description of result2
  ```

#### Type docstring template
````julia
"""
    MyType <: MyAbstractType

One-line desciption of my type which ends with a period.

If the one-line description is not sufficient, one can also write a short paragraph with additional information.

# Fields
- `field1::Type1`: Description of field1.
- `optional_field2::Type2 = value2` (optional): Description of field2. If not provided, defaults to `value2`.

# Examples
```julia-repl
julia> MyType(field1, field2)
result1
```

See also [`MyType2`](@ref), [`my_function2`](@ref).
"""
````

Written by **Judith Schepers**.