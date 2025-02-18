using MultiDocumenter, Documenter

clonedir = ("--temp" in ARGS) ? mktempdir() : joinpath(@__DIR__, "clones")
outpath = mktempdir()
@info """
Cloning packages into: $(clonedir)
Building aggregate site into: $(outpath)
"""
generate_name(a, b, c) = MultiDocumenter.@htl("<div class=\"headertitle\"> $a </div><br> Unfold<span style=\"color:$c;\">$b</span>.jl")

#---

Documenter.makedocs(
    sitename="Unfold.jl Ecosystem",
    modules=Module[],
    warnonly=true,
    format=Documenter.HTML(; inventory_version="1.0.0"), pages=["index.md"],# "90-contribution.md", "91-developer.md"],
)

#---

docs = [
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(@__DIR__, "build"),
        path="main",
        name=MultiDocumenter.@htl("<div class=\"homebutton\">Home</div>"),
        fix_canonical_url=false,
    ),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "Unfold.jl"),
        path="Unfold.jl",
        name=generate_name("Analysis", "", "#ccc"),
        giturl="https://github.com/unfoldtoolbox/Unfold.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldMixedModels.jl"),
        path="UnfoldMixedModels.jl",
        name=generate_name("LMM", "MixedModels", "#197BDD"),
        giturl="https://github.com/unfoldtoolbox/UnfoldMixedModels.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldMakie.jl"),
        path="UnfoldMakie.jl",
        name=generate_name("Visualization", "Makie", "#3AAA35"),#MultiDocumenter.@htl("<div class=\"headertitle\">Visualization </div><br> UnfoldMakie.jl"),
        giturl="https://github.com/unfoldtoolbox/UnfoldMakie.jl.git",
    ),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldSim.jl"),
        path="UnfoldSim.jl",
        name=generate_name("Simulation", "Sim", "#E6007E"),
        giturl="https://github.com/unfoldtoolbox/UnfoldSim.jl.git"),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldBIDS.jl"),
        path="UnfoldBIDS.jl",
        name=generate_name("Pipeline", "BIDS", "#FEC700"),
        giturl="https://github.com/unfoldtoolbox/UnfoldBIDS.jl.git"),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldStats.jl"),
        path="UnfoldStats.jl",
        name=generate_name("Statistics", "Stats", "#E30613"),#MultiDocumenter.@htl("<div class=\"headertitle\">Statistic </div><br> UnfoldStats.jl"),
        giturl="https://github.com/unfoldtoolbox/UnfoldStats.jl.git",),
    MultiDocumenter.MultiDocRef(
        upstream=joinpath(clonedir, "UnfoldDecode.jl"),
        path="UnfoldDecode.jl",
        name=generate_name("Decoding", "Decode", "#009BA4"),#MultiDocumenter.@htl("<div class=\"headertitle\">Decoding </div><br> UnfoldDecode.jl"),
        giturl="https://github.com/unfoldtoolbox/UnfoldDecode.jl.git",),
    MultiDocumenter.DropdownNav("Related Tools", [
        MultiDocumenter.MultiDocRef(
            upstream=joinpath(clonedir, "ClusterDepth.jl"),
            path="ClusterDepth.jl",
            name=MultiDocumenter.@htl("<div class=\"headertitle\">Multiple Comparisons with ClusterDepth.jl</div>"),
            giturl="https://github.com/s-ccs/ClusterDepth.jl.git",
        ),
        #=
        pyMNE has no docs :S
        MultiDocumenter.MultiDocRef(
            upstream=joinpath(clonedir, "PyMNE"),
            path="PyMNE.jl",
            name=MultiDocumenter.@htl("PyMNE.jl",
            giturl="https://github.com/beacon-biosignals/PyMNE.jl/",
        ),=#
        #DeepRecurrentEncoder.jl
    ]),
]

#outpath = joinpath(@__DIR__, "out")
#---
MultiDocumenter.make(
    outpath,
    docs;
    rootpath="/UnfoldDocs/",
    canonical_domain="https://unfoldtoolbox.github.io/",
    search_engine=MultiDocumenter.SearchConfig(
        index_versions=["stable"],
        engine=MultiDocumenter.FlexSearch
    ),
    custom_stylesheets=["assets/style.css"],
    hide_previews=true,
    prettyurls=true,
    assets_dir="assets"
)



if "deploy" in ARGS
    @warn "Deploying to GitHub" ARGS
    gitroot = @__DIR__#normpath(joinpath(@__DIR__, ".."))
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
    @info "Skipping deployment, 'deploy' not passed. Generated files in 'out'." ARGS
    cp(outpath, joinpath(@__DIR__, "out"), force=true)
end
