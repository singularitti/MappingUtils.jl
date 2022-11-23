using MappingUtils
using Documenter

DocMeta.setdocmeta!(MappingUtils, :DocTestSetup, :(using MappingUtils); recursive=true)

makedocs(;
    modules=[MappingUtils],
    authors="singularitti <singularitti@outlook.com> and contributors",
    repo="https://github.com/singularitti/MappingUtils.jl/blob/{commit}{path}#{line}",
    sitename="MappingUtils.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://singularitti.github.io/MappingUtils.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/singularitti/MappingUtils.jl",
    devbranch="main",
)
