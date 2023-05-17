using CairoMakie
using DataFrames
using Statistics
using CSV

epochs = 100

movingaverage(g, n) = [i < n ? mean(g[begin:i]) : mean(g[i-n+1:i]) for i in 1:length(g)]

# fig
fig = Figure(resolution=(1200, 400), fontsize=24)
min_x = 0
max_x = 100
markersize = 10
res = ["32x32", "64x64", "128x128", "256x256"]
N = [32, 64, 128, 256]
colors = [:blue, :green, :black, :red]

ax = Axis(fig[1,1], xlabel="Epochs", ylabel=L"N^2\overline{\mathcal{L}}")
for (r, n, c) in zip(res, N, colors)
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_off/losses.txt"
    df = DataFrame(CSV.File(filepath))
    lines!(ax, n^2 .* df[!, "Mean Test"], color = (c, 0.1), linestyle=:dash)
    lines!(ax, n^2 .* movingaverage(df[!, "Mean Test"], 15), label = "Baseline net " * r, color = c, linestyle=:dash)
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_on/losses.txt"
    df = DataFrame(CSV.File(filepath))
    lines!(ax, n^2 .* df[!, "Mean Test"], label = "Modified net " * r, color = c)
end
xlims!(ax, min_x, max_x)

ax = Axis(fig[1,2], xlabel="Epochs", ylabel=L"N^2\mathcal{L}'")
for (r, n, c) in zip(res, N, colors)
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_off/losses.txt"
    df = DataFrame(CSV.File(filepath))
    lines!(ax, n^2 .* df[!, "Spatial Test"], label = "Baseline net " * r, color = c, linestyle=:dash)
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_on/losses.txt"
    df = DataFrame(CSV.File(filepath))
    lines!(ax, n^2 .* df[!, "Spatial Test"], label = "Modified net " * r, color = c)
end
xlims!(ax, min_x, max_x)
axislegend(; position= :rt, labelsize=16)
resize_to_layout!(fig)

save("fig_loss_curves_epochs$epochs.png", fig, px_per_unit = 2)
