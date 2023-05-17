using CairoMakie
using PNGFiles

epochs = 100
smooth = true
sm = smooth ? "/smooth/" : "/"

# fig
FT = Float64
ch = 1
fig = Figure(resolution=(5500, 2000), fontsize=84)

# 32x32 data
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_1.png"
img1_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_2.png"
img2_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_3.png"
img3_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_4.png"
img4_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_5.png"
img5_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_6.png"
img6_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_7.png"
img7_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_8.png"
img8_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_1.png"
img1_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_2.png"
img2_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_3.png"
img3_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_4.png"
img4_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_5.png"
img5_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_6.png"
img6_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_7.png"
img7_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_32x32_all_mods_off$(sm)imgs/data_ch1_8.png"
img8_w = FT.(PNGFiles.load(filepath))
ax = Axis(fig[1,1], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, title="Baseline Net", titlefont = :bold, ylabel="data", titlealign=:left)
heatmap!(ax, img1_wo, colormap=Reverse(:grays))
ax = Axis(fig[1,2], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_wo, colormap=Reverse(:grays))
ax = Axis(fig[1,3], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_wo, colormap=Reverse(:grays))
ax = Axis(fig[1,4], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_wo, colormap=Reverse(:grays))
# ax = Axis(fig[1,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_wo, colormap=Reverse(:grays))
# ax = Axis(fig[1,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_wo, colormap=Reverse(:grays))
ax = Axis(fig[1,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_wo, colormap=Reverse(:grays))
ax = Axis(fig[1,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_wo, colormap=Reverse(:grays))
ax = Axis(fig[1,8], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, title="Modified Net", titlefont = :bold, ylabel="data", titlealign=:left)
heatmap!(ax, img1_w, colormap=Reverse(:grays))
ax = Axis(fig[1,9], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_w, colormap=Reverse(:grays))
ax = Axis(fig[1,10], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_w, colormap=Reverse(:grays))
ax = Axis(fig[1,11], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_w, colormap=Reverse(:grays))
# ax = Axis(fig[1,14], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_w, colormap=Reverse(:grays))
# ax = Axis(fig[1,15], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_w, colormap=Reverse(:grays))
ax = Axis(fig[1,12], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_w, colormap=Reverse(:grays))
ax = Axis(fig[1,13], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_w, colormap=Reverse(:grays))

size = "32x32"
row = 2
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_1.png"
img1_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_2.png"
img2_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_3.png"
img3_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_4.png"
img4_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_5.png"
img5_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_6.png"
img6_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_7.png"
img7_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_8.png"
img8_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_1.png"
img1_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_2.png"
img2_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_3.png"
img3_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_4.png"
img4_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_5.png"
img5_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_6.png"
img6_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_7.png"
img7_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_8.png"
img8_w = FT.(PNGFiles.load(filepath))
ax = Axis(fig[row,1], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,2], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,3], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,4], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_wo, colormap=Reverse(:grays))
# ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_wo, colormap=Reverse(:grays))
# ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,8], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_w, colormap=Reverse(:grays))
ax = Axis(fig[row,9], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_w, colormap=Reverse(:grays))
ax = Axis(fig[row,10], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_w, colormap=Reverse(:grays))
ax = Axis(fig[row,11], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,14], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,15], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_w, colormap=Reverse(:grays))
ax = Axis(fig[row,12], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_w, colormap=Reverse(:grays))
ax = Axis(fig[row,13], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_w, colormap=Reverse(:grays))


size = "64x64"
row = 3
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_1.png"
img1_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_2.png"
img2_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_3.png"
img3_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_4.png"
img4_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_5.png"
img5_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_6.png"
img6_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_7.png"
img7_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_8.png"
img8_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_1.png"
img1_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_2.png"
img2_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_3.png"
img3_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_4.png"
img4_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_5.png"
img5_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_6.png"
img6_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_7.png"
img7_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_8.png"
img8_w = FT.(PNGFiles.load(filepath))
ax = Axis(fig[row,1], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,2], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,3], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,4], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_wo, colormap=Reverse(:grays))
# ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_wo, colormap=Reverse(:grays))
# ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,8], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_w, colormap=Reverse(:grays))
ax = Axis(fig[row,9], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_w, colormap=Reverse(:grays))
ax = Axis(fig[row,10], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_w, colormap=Reverse(:grays))
ax = Axis(fig[row,11], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,14], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,15], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_w, colormap=Reverse(:grays))
ax = Axis(fig[row,12], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_w, colormap=Reverse(:grays))
ax = Axis(fig[row,13], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_w, colormap=Reverse(:grays))

size = "128x128"
row = 4
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_1.png"
img1_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_2.png"
img2_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_3.png"
img3_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_4.png"
img4_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_5.png"
img5_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_6.png"
img6_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_7.png"
img7_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_8.png"
img8_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_1.png"
img1_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_2.png"
img2_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_3.png"
img3_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_4.png"
img4_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_5.png"
img5_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_6.png"
img6_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_7.png"
img7_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_8.png"
img8_w = FT.(PNGFiles.load(filepath))
ax = Axis(fig[row,1], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,2], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,3], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,4], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_wo, colormap=Reverse(:grays))
# ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_wo, colormap=Reverse(:grays))
# ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,8], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_w, colormap=Reverse(:grays))
ax = Axis(fig[row,9], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_w, colormap=Reverse(:grays))
ax = Axis(fig[row,10], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_w, colormap=Reverse(:grays))
ax = Axis(fig[row,11], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,14], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,15], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_w, colormap=Reverse(:grays))
ax = Axis(fig[row,12], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_w, colormap=Reverse(:grays))
ax = Axis(fig[row,13], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_w, colormap=Reverse(:grays))

size = "256x256"
row = 5
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_1.png"
img1_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_24.png"
img2_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_3.png"
img3_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_4.png"
img4_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_5.png"
img5_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_6.png"
img6_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_7.png"
img7_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_off$(sm)imgs/gen_ch1_8.png"
img8_wo = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_1.png"
img1_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_2.png"
img2_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_3.png"
img3_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_4.png"
img4_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_5.png"
img5_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_6.png"
img6_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_7.png"
img7_w = FT.(PNGFiles.load(filepath))
filepath = "data/epochs$(epochs)/Experiment_" * size * "_all_mods_on$(sm)imgs/gen_ch1_8.png"
img8_w = FT.(PNGFiles.load(filepath))
ax = Axis(fig[row,1], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_wo, colormap=:OrRd)
ax = Axis(fig[row,2], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_wo, colormap=:OrRd)
ax = Axis(fig[row,3], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,4], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_wo, colormap=:OrRd)
# ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_wo, colormap=:OrRd)
# ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_wo, colormap=:OrRd)
ax = Axis(fig[row,5], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,6], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_wo, colormap=Reverse(:grays))
ax = Axis(fig[row,8], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true, ylabel=size )
heatmap!(ax, img1_w, colormap=Reverse(:grays))
ax = Axis(fig[row,9], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img2_w, colormap=Reverse(:grays))
ax = Axis(fig[row,10], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img3_w, colormap=Reverse(:grays))
ax = Axis(fig[row,11], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img4_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,14], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img5_w, colormap=Reverse(:grays))
# ax = Axis(fig[row,15], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
# heatmap!(ax, img6_w, colormap=Reverse(:grays))
ax = Axis(fig[row,12], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img7_w, colormap=Reverse(:grays))
ax = Axis(fig[row,13], xticklabelsvisible = false, xticksvisible = false, yticklabelsvisible = false, yticksvisible = false, yreversed=true)
heatmap!(ax, img8_w, colormap=Reverse(:grays))

if smooth
    save("fig_samples_epochs$(epochs)_smooth.png", fig, px_per_unit = 2)
else
    save("fig_samples_epochs$epochs.png", fig, px_per_unit = 2)
end
