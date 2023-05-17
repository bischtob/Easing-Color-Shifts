@testset "Utils" begin
    @testset "Training utils" begin
        @test EasingColorShifts.struct2dict(0) == 0
        @test EasingColorShifts.struct2dict(true) == true
        @test EasingColorShifts.struct2dict("lol") == "lol"
        @test EasingColorShifts.struct2dict((; a = 1, b = true)) == Dict(:a => 1, :b => true)
    end
end