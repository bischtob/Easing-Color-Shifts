using CairoMakie
using DataFrames
using Statistics
using CSV

FT = Float64

epochs = 100

markersize = 30
x = [32, 64, 128, 256]
y = Float64[]
y2 = Float64[]
y3 = Float64[]
y4 = Float64[]
res = ["32x32", "64x64", "128x128", "256x256"]
for r in res
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_off/losses.txt"
    df = DataFrame(CSV.File(filepath))
    push!(y, FT(df[!, "Mean Test"][end]))
    push!(y2, FT(df[!, "Mean Train"][end]))
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_on/losses.txt"
    df = DataFrame(CSV.File(filepath))
    push!(y3, FT(df[!, "Mean Test"][end]))
    push!(y4, FT(df[!, "Mean Train"][end]))
end

y_smooth = Float64[]
y2_smooth = Float64[]
y3_smooth = Float64[]
y4_smooth = Float64[]
res = ["32x32", "64x64", "128x128", "256x256"]
for r in res
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_off/losses_smooth.txt"
    df = DataFrame(CSV.File(filepath))
    push!(y_smooth, FT(df[!, "Mean Test"][end]))
    push!(y2_smooth, FT(df[!, "Mean Train"][end]))
    filepath = "data/epochs$epochs/Experiment_" * r * "_all_mods_on/losses_smooth.txt"
    df = DataFrame(CSV.File(filepath))
    push!(y3_smooth, FT(df[!, "Mean Test"][end]))
    push!(y4_smooth, FT(df[!, "Mean Train"][end]))
end

# fig
fig = Figure(resolution=(1200, 400), fontsize=24)
yticks = (y, map(x -> string(round(Int, x / 10^-5)), y))
ax = Axis(fig[1,1], xlabel=L"N", ylabel=L"\bar{L}", title="without EMA", titlealign=:left, yticks=yticks, xticks=x)
plot!(ax, x, y, label = "Baseline net test error", markersize=markersize)
plot!(ax, x, y2, color=:red, label="Baseline net train error", markersize=markersize)
plot!(ax, x, y3, color=:black, marker = :star4, label="Modified net test error", markersize=markersize)
plot!(ax, x, y4, color=:red, marker = :star4, label="Modified net train error", markersize=markersize)

ax = Axis(fig[1,2], xlabel=L"N", title="with EMA", titlealign=:left, yticks=yticks, xticks=x)
plot!(ax, x, y_smooth, label = "Baseline net test error", markersize=markersize)
plot!(ax, x, y2_smooth, color=:red, label="Baseline net train error", markersize=markersize)
plot!(ax, x, y3_smooth, color=:black, marker = :star4, label="Modified net test error", markersize=markersize)
plot!(ax, x, y4_smooth, color=:red, marker = :star4, label="Modified net train error", markersize=markersize)
axislegend(; position= :rt, labelsize=16)

save("fig_losses_naive_epochs$epochs.png", fig, px_per_unit = 2)

# fig
fig = Figure(resolution=(1200, 400), fontsize=24)
min_y = 0.5
max_y = 1.2

# yticks = (y.*x.^2, map(x -> string(round(Int, x / 10^0)), y.*x.^2))
ax = Axis(fig[1,1], xlabel=L"N", ylabel=L"N^2\bar{L}", title="without EMA", titlealign=:left, xticks=x)
plot!(ax, x, y.*x.^2, label = "Baseline net test error", markersize=markersize)
plot!(ax, x, y2.*x.^2, color=:red, label="Baseline net train error", markersize=markersize)
plot!(ax, x, y3.*x.^2, color=:black, marker = :star4, label="Modified net test error", markersize=markersize)
plot!(ax, x, y4.*x.^2, color=:red, marker = :star4, label="Modified net train error", markersize=markersize)
axislegend(; position= :lt, labelsize=14)
ylims!(ax, min_y, max_y)

ax = Axis(fig[1,2], xlabel=L"N", title="with EMA", titlealign=:left, xticks=x)
plot!(ax, x, y_smooth.*x.^2, label = "Baseline net test error", markersize=markersize)
plot!(ax, x, y2_smooth.*x.^2, color=:red, label="Baseline net train error", markersize=markersize)
plot!(ax, x, y3_smooth.*x.^2, color=:black, marker = :star4, label="Modified net test error", markersize=markersize)
plot!(ax, x, y4_smooth.*x.^2, color=:red, marker = :star4, label="Modified net train error", markersize=markersize)
ylims!(ax, min_y, max_y)

save("fig_losses_weighted_epochs$epochs.png", fig, px_per_unit = 2)
