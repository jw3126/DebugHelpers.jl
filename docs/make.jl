using DebugHelpers
using Documenter

DocMeta.setdocmeta!(DebugHelpers, :DocTestSetup, :(using DebugHelpers); recursive=true)

makedocs(;
    modules=[DebugHelpers],
    authors="Jan Weidner <jw3126@gmail.com> and contributors",
    repo="https://github.com/jw3126/DebugHelpers.jl/blob/{commit}{path}#{line}",
    sitename="DebugHelpers.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://jw3126.github.io/DebugHelpers.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/jw3126/DebugHelpers.jl",
    devbranch="main",
)
