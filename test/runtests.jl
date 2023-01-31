using DebugHelpers: @into_scope
using Test

safehouse = [
    Dict(:a=>1, :b=>2),
    Dict(:a=>10, :b=>20, :c=>30),
]
@testset "@into_scope" begin
    @test !isdefined(@__MODULE__, :a)
    @test !isdefined(@__MODULE__, :b)
    @test !isdefined(@__MODULE__, :c)
    @into_scope safehouse[1]
    @test a == 1
    @test b == 2
    @test !isdefined(@__MODULE__, :c)
    @into_scope safehouse[2]
    @test a == 10
    @test b == 20
    @test c == 30
end
@test !isdefined(@__MODULE__, :a)
@test !isdefined(@__MODULE__, :b)
@test !isdefined(@__MODULE__, :c)
