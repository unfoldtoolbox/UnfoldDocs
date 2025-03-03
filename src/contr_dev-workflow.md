

## Development/GitHub Workflow
The following documentation is adapted from the [BestieTemplate.jl developer documentation](https://juliabesties.github.io/BestieTemplate.jl/stable/91-developer/) but has been customized to fit our needs.  

### Before you start coding
1. Check whether there exists a GitHub issue about the topic (e.g. bug, new feature etc). If not create one with a short description of the problem or feature idea.
2. Discuss your approach with the package maintainers either in the issue or via another channel.

### First time clone & development version

If this is the first time you work with this repository, follow the instructions below to clone the repository and create a `dev` version. 

!!! tip "`dev` version of a Julia package"
    Having a `dev` (development) version of a Julia package allows you to import a local version of the package with your changes instead of the registered package version (which is static).

#### a) If you have writing access for the GitHub repository
(we will use `UnfoldSim` as an example)
- Option 1: Clone this repository using `git clone`.
- Option 2 (recommended): Use the Julia `dev` command to create a development version of the package:
    1. Start a Julia session and run `cd("/path/to/your/project")` to navigate to your project folder.
    2. Press `]` to enter `pkg` mode.
    3. Run `dev --local UnfoldSim` to clone the package to `./dev/UnfoldSim` and automatically add it to your Julia project environment.

!!! important
    If you have writing rights, whenever **upstream** is mentioned below, use **origin** instead.

#### b) If you don't have writing access for the GitHub repository
1. Fork the UnfoldSim.jl repository.
2. Clone your repository (this will create a `git remote` called `origin`).
3. Add the UnfoldSim.jl repository as a remote:

   ```bash
   git remote add upstream https://github.com/unfoldtoolbox/UnfoldSim.jl
   ```

This will ensure that you have two remotes in your git: `origin` and `upstream`.
You will create branches and push to `origin`, and you will fetch and update your local `main` branch from `upstream`.

!!! tip "`dev` version without writing rights"
    You can also use the `dev` command on your fork. Run `]dev --local url/of/your/fork` to clone the package to `./dev/UnfoldSim` and automatically add it to your Julia project environment.

### Revise.jl
Further, we recommend to use [`Revise.jl`](https://github.com/timholy/Revise.jl): a Julia package which allows you to track source code changes in a running Julia session without need to restart it and reload the package.

We recommend to install it in the global environment:
```julia-repl
julia> # Press ]
pkg> activate
pkg> add Revise
```

### Working on a new issue

We try to keep a linear Git history in this repository, so it is important to keep your branches up-to-date.

1. Fetch from the remote and fast-forward your local main

   ```bash
   git fetch upstream
   git switch main
   git merge --ff-only upstream/main
   ```

2. Branch from `main` to address the issue (see below for naming)

   ```bash
   git switch -c 42-add-answer-universe
   ```

3. Push the new local branch to your personal remote repository

   ```bash
   git push -u origin 42-add-answer-universe
   ```

4. Create a pull request to merge your remote branch into the `main` branch of the original UnfoldSim.jl repository.

#### Branch naming

- If there is an associated issue, add the issue number.
- If there is no associated issue, **and the changes are small**, add a prefix such as "typo", "hotfix", "small-refactor", according to the type of update.
- If the changes are not small and there is no associated issue, then either create an issue first, or discuss in another channel with the maintainers.
- Use dash separated imperative wording related to the issue (e.g., `14-add-tests`, `15-fix-model`, `16-remove-obsolete-files`).

#### Commit messages

- Use imperative or present tense, for instance: *Add feature* or *Fix bug*.
- Have informative titles.
- When necessary, add a body with details.
- If there are breaking changes, add the information to the commit message.

### Before creating a pull request

- Ideally: Make sure the tests pass (see [Testing](@ref)).
- Add appropriate documentation (ideally using the [Docstring templates](@ref)).
- Ideally: Follow the formatting rules from `JuliaFormatter.jl` (see [Formatting](@ref)).
- Fetch any `main` updates from upstream and rebase your branch, if necessary:

  ```bash
  git fetch upstream
  git rebase upstream/main BRANCH_NAME
  ```

- Then you can open a pull request and work with the reviewer to address any issues.

### Working with a pull request

Ideally, one pull request should solve one problem. Otherwise, it is difficult to review and track changes.


Written by **Judith Schepers**.