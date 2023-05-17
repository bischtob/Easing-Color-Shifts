using CairoMakie
using DataFrames
using Statistics
using CSV

epochs = 100
smooth = false
sm = smooth ? "/smooth/" : "/"

# fig
ch = 1
cumu = 1
nsamples = 200
nsamples_256 = 100
fig = Figure(resolution=(1000, 400), fontsize=24)
min_x = 0.5
max_x = 4.5
min_y = -0.5
max_y = 2.0
xticks = (0.5:0.5:4.5, ["", "32x32", "", "64x64", "", "128x128", "", "256x256", ""])

# baseline
x = Int[]
y = Float32[]
dodge = Int[]
side = Symbol[]

res = "32x32"
i = 1
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples), 2ones(Int, nsamples))
side = vcat(side, [:left for _ in 1:nsamples], [:right for _ in 1:nsamples])
x = vcat(x, i*ones(Int, 2nsamples))

res = "64x64"
i = 2
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples), 2ones(Int, nsamples))
side = vcat(side, [:left for _ in 1:nsamples], [:right for _ in 1:nsamples])
x = vcat(x, i*ones(Int, 2nsamples))

res = "128x128"
i = 3
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples), 2ones(Int, nsamples))
side = vcat(side, [:left for _ in 1:nsamples], [:right for _ in 1:nsamples])
x = vcat(x, i*ones(Int, 2nsamples))

res = "256x256"
i = 4
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples_256), 2ones(Int, nsamples_256))
side = vcat(side, [:left for _ in 1:nsamples_256], [:right for _ in 1:nsamples_256])
x = vcat(x, i*ones(Int, 2nsamples_256))

color = @. ifelse(side === :left, :orange, :teal)

ax = Axis(fig[1,1], xlabel="Resolution", ylabel="Spatial mean", title="Baseline Net", xticks=xticks, titlealign=:left)
violin!(ax, x, y, side = side, color = color, label="data")
xlims!(ax, min_x, max_x)
ylims!(ax, min_y, max_y)

# modification on
x = Int[]
y = Float32[]
dodge = Int[]
side = Symbol[]

res = "32x32"
i = 1
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_on$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples), 2ones(Int, nsamples))
side = vcat(side, [:left for _ in 1:nsamples], [:right for _ in 1:nsamples])
x = vcat(x, i*ones(Int, 2nsamples))

res = "64x64"
i = 2
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_on$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples), 2ones(Int, nsamples))
side = vcat(side, [:left for _ in 1:nsamples], [:right for _ in 1:nsamples])
x = vcat(x, i*ones(Int, 2nsamples))

res = "128x128"
i = 3
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_on$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples), 2ones(Int, nsamples))
side = vcat(side, [:left for _ in 1:nsamples], [:right for _ in 1:nsamples])
x = vcat(x, i*ones(Int, 2nsamples))

res = "256x256"
i = 4
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_off$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== true) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
filepath = "data/epochs$epochs/Experiment_" * res * "_all_mods_on$(sm)cumulants.csv"
df = DataFrame(CSV.File(filepath))
y = vcat(y, df[(df.isreal .== false) .&& (df.channel .== ch) .&& (df.cumulant .== cumu), :].values)
dodge = vcat(dodge, ones(Int, nsamples_256), 2ones(Int, nsamples_256))
side = vcat(side, [:left for _ in 1:nsamples_256], [:right for _ in 1:nsamples_256])
x = vcat(x, i*ones(Int, 2nsamples_256))

color = @. ifelse(side === :left, :orange, :teal)

ax = Axis(fig[1,2], xlabel="Resolution", title="Modified Net", xticks=xticks, yticklabelsvisible=false, titlealign=:left)
p = violin!(ax, x, y, side = side, color = color, label=["data", "generated"])
xlims!(ax, min_x, max_x)
ylims!(ax, min_y, max_y)

# legend
ccolors = [:orange, :teal]
elems = [[MarkerElement(color = col, marker=:circle, markersize = 15, strokecolor = :black)] for col in ccolors]
axislegend(ax, elems, ["Real data", "Generated data"]; position=:rt, labelsize=16)

if smooth
    save("fig_mean_compact_epochs$(epochs)_smooth.png", fig, px_per_unit = 2)
else
    save("fig_mean_compact_epochs$epochs.png", fig, px_per_unit = 2)
end
