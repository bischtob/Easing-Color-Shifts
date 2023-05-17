using CUDA
using Dates
using Flux
using Random
using TOML

using EasingColorShifts
using EasingColorShifts: dict2nt
using EasingColorShifts: VarianceExplodingSDE, NoiseConditionalScoreNetwork
using EasingColorShifts: score_matching_loss
using EasingColorShifts: WarmupSchedule, ExponentialMovingAverage
using EasingColorShifts: train!, load_model_and_optimizer

package_dir = pkgdir(EasingColorShifts)
include(joinpath(package_dir,"examples/utils_data.jl")) # for data loading
include("analysis.jl") # for analysis

function run_eval(params; FT=Float32, logger=nothing)
    # unpack params
    savedir = params.experiment.savedir
    rngseed = params.experiment.rngseed
    nogpu = params.experiment.nogpu
    batchsize = params.data.batchsize
    tilesize = params.data.tilesize
    avg_weight::FT = params.loss.avg_weight
    dev_weight::FT = params.loss.dev_weight

    # set up rng
    rngseed > 0 && Random.seed!(rngseed)

    # set up device
    if !nogpu && CUDA.has_cuda()
        device = Flux.gpu
        @info "Training on GPU"
    else
        device = Flux.cpu
        @info "Training on CPU"
    end

    # set up dataset
    dataloaders = get_data_fashion_mnist(
        tilesize = tilesize, 
        batchsize;
        FT=FT
    )
    
    # set up model
    checkpoint_path = joinpath(savedir, "checkpoint.bson")
    BSON.@load checkpoint_path model model_smooth opt opt_smooth
    model = device(model_smooth)

    # set up loss function
    lossfn = x -> score_matching_loss(model, x, avg_weight = avg_weight, dev_weight = dev_weight)

    # calculate losses and store
    epoch = 100
    loss_train, loss_test = EasingColorShifts.compute_losses(lossfn, dataloaders, device)
    open(joinpath(savedir, "losses_smooth.txt"),"a") do io
        loss_names = reshape(["#Epoch", "Mean Train", "Spatial Train","Mean Test","Spatial Test"], (1,5))
        DelimitedFiles.writedlm(io, loss_names,',')
        DelimitedFiles.writedlm(io, transpose([epoch, loss_train...,loss_test...]),',')
    end
end

function main(; experiment_toml="Experiment.toml")
    FT = Float32

    # read experiment parameters from file
    params = TOML.parsefile(experiment_toml)
    params = EasingColorShifts.dict2nt(params)

    # set up directory for saving checkpoints
    !ispath(params.experiment.savedir) && mkpath(params.experiment.savedir)

    # start logging if applicable
    logger = nothing

    run_eval(params; FT=FT, logger=logger)

    # close the logger after the run to avoid hanging logger
    if params.experiment.logging
        close(logger)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main(experiment_toml = ARGS[1])
end
