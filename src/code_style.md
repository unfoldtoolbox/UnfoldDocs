# Clear and concise Code  
1. Variables and Function Names should have meaningful names and we try to follow the [Julia naming convention](https://docs.julialang.org/en/v1/manual/style-guide/#Use-naming-conventions-consistent-with-Julia-base/). Try to find names that are descriptive and domain specific, e.g. `generate_events`.
2. Try to structure your program into meaningful subfunctions. As a rule of thumb, if your function is longer than 50 lines of code, has nested loops, nested if-else clauses, you'd better have a justification for it, or refactor it into smaller, reusable (and testable) functions.
3. Structure your functions into multiple files, separated on a conceptual basis.
4. Try to keep [formatting consistent across all files](https://unfoldtoolbox.github.io/UnfoldDocs/main/contr_formatting/).
5. Minimize external dependencies. Use external libraries only when necessary to avoid compatibility issues and reduce installation and load times.
6. Comment your code, especially if the code is not self-explanatory.
7. Modularity: It's best if users can customize functionality without having to modify the package code. Good practices: avoid hardcoded parameters, make attributes (e.g. in figures) customizable, use inheritance from `AbstractTypes`.
6. Most users will not check the defaults, make sure they are sensible and nudge users to provide their own.


# Backward compatibility 
Idally, new versions should produce the same results without any changes to the user's code. If not, a breaking release is required to indicate changed behavior.

1. Maintain a clear changelog for new releases. Include down major and breaking changes, new features, documentation updates, and bug fixes.  [Example](https://github.com/unfoldtoolbox/UnfoldSim.jl/releases).
2. Avoid breaking changes when possible. The change is considered as breaking if you alter:
  - function names;  
  - argument names;  
  - output formats (e.g. switching from `dict` to `vector`).  
3. Use deprecation warnings. If a feature is going to be removed in a future release, use deprecation warnings (`@deprecate') to tell users what has changed and how to use the function now.

# User-Friendliness / Documentation
1. Every function exposed to the user should have docstrings specifying all parameters, their types, and input/output arguments. Check the [Template](https://unfoldtoolbox.github.io/UnfoldDocs/main/developer/#Docstring-templates).
2. Try to organise your documentation based on [four ways of documentation](https://docs.divio.com/documentation-system/): tutorials, how-to's, explanation and reference documentation.
3. Try to include visuals and code examples in the documentation.
4. Provide meaningful error messages that guide users to solutions.
5. If possible, test the usability of your documentation with non-expert users to identify areas for improvement.

Written by **Vladimir Mikheev**
