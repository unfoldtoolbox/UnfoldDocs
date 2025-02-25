# Clear Code  

1. Code should be clear and concise.  
2. Variables in the code should have meaningful names.  
3. Function naming should follow [Julia naming convention](https://docs.julialang.org/en/v1/manual/style-guide/#Use-naming-conventions-consistent-with-Julia-base/).
3.1. If necessary, function names should be based on some theoretical background. For example, if you want to create a function to plot a scatterplot (established name), call it `plot_scatterplot', but not `plot_dots'. 
4. Avoid functions longer than 50 lines of code to improve code readability. It makes it hard to read and search.
4.1. Write modular code by breaking complex tasks into smaller, reusable functions.
4.2. Avoid multiple loop in loops or conditions in conditions.
5. Avoid putting more than 5 functions in a single file. It prevents readablitiy in searching. 
6. Avoid pull requests that affect more than 10 files. Ideally, one pull request should solve one problem. Otherwise, it is difficult to review and track changes.
7. Maintain consistent indentation and formatting across all files. Enforce it with linters (e.g., JuliaFormatter).
8. Write meaningful commit messages that explain what changed and why. Check how to write them [here](https://unfoldtoolbox.github.io/UnfoldDocs/main/developer/#Commit-messages).
9. Minimize external dependencies. Only use external libraries when necessary to avoid compatibility issues and to reduce installation and loading time.
10. Comment the code, especially if the code is not self-explanatory.

# Backward compatibility 
New versions of your software should produce exactly the same output without any changes to the user's code. If not, a breaking release is necessary.

1. Provide a clear changelog for new versions, detailing new features, fixes, and potential breaking changes. [Example](https://github.com/unfoldtoolbox/Unfold.jl/releases).
2. Avoid breaking changes whenever possible. 
3. Ensure consistent output formats. If your function previously returned a dictionary, avoid switching it to a list unless necessary.
4. Use deprecation warnings. If a feature will be removed in future versions, notify users with warnings instead of immediately breaking their code.
5. Use versioned documentation. Keep documentation for previous versions accessible so users with older codebases can still find relevant information.
6. Avoid removing or renaming functions or their arguments. If you must remove a function or its argument, keep the old name as an alias or mark it as deprecated before removal.

# User-Friendliness  

1. Every function exposed to the user should have docstrings specifying all parameters, their types, and input/output arguments. Check the [Template](https://unfoldtoolbox.github.io/UnfoldDocs/main/developer/#Docstring-templates). 
2. Ensure the documentation includes visual and code examples where applicable. Expecially, if the figure is commonly used and/or complex.   
3. Provide meaningful error messages that guide users toward solutions.
4. Test the usability of your code with non-expert users to identify areas of improvement.
5. For figures:
5.1. Users should have the ability to customize all parts of the figure.  
5.2. Most users will not check the default settings, so it is important to encourage them to label key details of the figure. 


Written by **Vladimir Mikheev**
