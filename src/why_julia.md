# Why Julia?
Some of you may ask, why Julia? Was [Matlab-Unfold](www.unfoldtoolbox.org) not good enough?

There are two main answers, one specific to Unfold, one more general.

Initially and **specifically to Unfold.jl** was the impossibility to adapt many LMMs to Matlab ([we tried](abandon unmixed toolbox)). Julia's `MixedModels.jl` results in up to 100x speedup (compared to `LME4`). 

More **generally**, we came up with a list of things that make Julia exceptionally well suited for science:

+ 🚀 Easy to write fast code. Solves the 2-language problem: you have simple python-like code, but at the speed of mex/numba/cython. This allows "normal" scientists to produce efficient code without needing the C++ skills.

+ 🤝 Easy interoperability with Python, R, and Matlab. If a library does not exist in Julia, simply call it from another language.

+ 📦 Built-in reproducible package management. Think of Python's `conda-env`, but actually working & fast.

+ 🈳 Built-in support for unicode via latex `\beta=𝛽`.

+ 🔤 Syntax is easy, a mix of R/MatLab/Python.

### Compared to MatLab
All of the above, but in addition:

+ 💸 It is free.

+ ✅ Automated unit testing and documentation are much easier.

### Compared to Python
All of the above, but in addition:

+ 🧮 LinearAlgebra integrated. No more `np.diff(np.mult(A,B))` etc.





