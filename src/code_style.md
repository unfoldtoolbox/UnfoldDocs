# Clear and concise Code  
1. Variables and Function Names should have meaningful names and we try to follow the [Julia naming convention](https://docs.julialang.org/en/v1/manual/style-guide/#Use-naming-conventions-consistent-with-Julia-base/). Try to find names that are descriptive and domain specific, e.g. `generate_events`.
2. Try to structure your program in meaningful subfunctions. As a rule of thumb, if your function is longer than 50 lines of code, has nested loops, nested if-clauses, you'd want to have a justification for it, or refactor it in smaller, reusable (and testable) functions.
3. Structure your functions in multiple files split up by conceptual reasoning.
4. Try to maintain a consistent formatting across all files. Enforce it with linters (e.g., JuliaFormatter) => Link to Format thingy.
5. Minimize external dependencies. Only use external libraries when necessary, to avoid compatibility issues and to reduce installation and loading time.
6. Comment your code, especially if the code is not self-explanatory.
7. Modularity: It's best if users can customize functionality without needing to modify the package code. That touches on e.g. no hardcoded parameters, making details (e.g. in figures) customizable, using inheritance from `AbstractTypes`.
5.2. Most users will not check the default settings, so it is important to encourage them to label key details of the figure. 


# Backward compatibility 
New versions of your software should produce exactly the same output without any changes to the user's code. If not, a breaking release is necessary.

1. Provide a clear changelog for new versions, detailing breaking changes, new features, documentation changes and bugfixes [Example](https://github.com/unfoldtoolbox/UnfoldSim.jl/releases).
2. Avoid breaking changes whenever possible. All the following things are breaking:
  - Changing function names
  - arguments names
  - output formats (E.g. return from `dict` to `vector`,)    
3. Use deprecation warnings. If a feature will be removed in future versions, notify users with deprecation warnings (`@deprecate`) instead of immediately breaking their code.


# User-Friendliness / Documentation
1. Every function exposed to the user should have docstrings specifying all parameters, their types, and input/output arguments. Check the [Template](https://unfoldtoolbox.github.io/UnfoldDocs/main/developer/#Docstring-templates).
2. Try to follow the [four ways of documentation](https://docs.divio.com/documentation-system/), tutorials, how-to's, explanation and reference documentation.
3. Try to include visuals and code examples in the documentation.
4. Provide meaningful error messages that guide users toward solutions.
5. If possible, test the usability of your documentation with non-expert users to identify areas of improvement.


=> 7. Ideally, one pull request should solve one problem. Otherwise, it is difficult to review and track changes. [move this to developer guide]

Written by **Vladimir Mikheev**
