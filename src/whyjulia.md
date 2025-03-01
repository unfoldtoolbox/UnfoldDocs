# Why Julia?
Some of you are wondering, why Julia? Was [matlab-Unfold](www.unfoldtoolbox.org) not good enough?

There are two main answers, one specific to Unfold, one more general.

Initially and **specifically to Unfold.jl** was the impossibility to fitting many LMMs matlab ([we tried](abandoneon unmixed toolbox)), and Julia's MixedModels.jl results in an up-to-100x speed increase (compared to LME4). Also the ecosystem and functionality was always growing, and automated unittests and documentation are quite cumbersome in matlab.

More **generally**, we came up with a list of things that make Julia exceptionally well suited for science:

+ 🚀easy to make fast code – solves 2-language problem (python like code – but speed of mex/numba/cython). This makes it possible for "normal" scientists to produce efficient code without requiring computer scientists' C++ skills

+ Easy interoperability with python, R and matlab. If a library does not yet exist, just call it from a different language.

+ 📦 Inbuilt reproducible package management (think conda-env, but actually working & fast)

+ 🔤 Syntax is easy, a mix of R/MatLab/Python

+ 🈳 inbuilt support for unicode via latex `\beta=𝛽`

### Compared to MatLab
All of the above, but in addition:

+ 💸 It is free

### Compared to python
All of the above, but in addition:

+ 🧮 LinearAlgebra ingrained (no more `np.diff(np.mult(A,B))` etc.)





