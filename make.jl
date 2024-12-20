using MultiDocumenter

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath = mktempdir()
@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""

docs = [
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "Unfold.jl"),
        path="Unfold.jl",
        name="Unfold.jl",
        giturl="https://github.com/unfoldtoolbox/Unfold.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldMakie.jl"),
        path="UnfoldMakie.jl",
        name="UnfoldMakie.jl",
        giturl="https://github.com/unfoldtoolbox/UnfoldMakie.jl.git",
    ), MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldSim.jl"),
        path="UnfoldSim.jl",
        name="UnfoldSim.jl",
        giturl="https://github.com/unfoldtoolbox/UnfoldSim.jl.git",
        # or use ssh instead for private repos:
        # giturl = "git@github.com:JuliaComputing/DataSets.jl.git",
    ),
]

outpath = joinpath(@__DIR__, "out")

MultiDocumenter.make(
    outpath,
    docs;
    search_engine=MultiDocumenter.SearchConfig(
        index_versions=["stable"],
        engine=MultiDocumenter.FlexSearch
    )
)



if "deploy" in ARGS
    @warn "Deploying to GitHub" ARGS
    gitroot = normpath(joinpath(@__DIR__, ".."))
    run(`git pull`)
    outbranch = "gh-pages"
    has_outbranch = true
    if !success(`git checkout $outbranch`)
        has_outbranch = false
        if !success(`git switch --orphan $outbranch`)
            @error "Cannot create new orphaned branch $outbranch."
            exit(1)
        end
    end
    for file in readdir(gitroot; join=true)
        endswith(file, ".git") && continue
        rm(file; force=true, recursive=true)
    end
    for file in readdir(outpath)
        cp(joinpath(outpath, file), joinpath(gitroot, file))
    end
    run(`git add .`)
    if success(`git commit -m 'Aggregate documentation'`)
        @info "Pushing updated documentation."
        if has_outbranch
            run(`git push`)
        else
            run(`git push -u origin $outbranch`)
        end
        run(`git checkout main`)
    else
        @info "No changes to aggregated documentation."
    end
else
    @info "Skipping deployment, 'deploy' not passed. Generated files in docs/out." ARGS
    cp(outpath, joinpath(@__DIR__, "out"), force=true)
end