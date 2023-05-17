using JLD2
using FFTW
using MLDatasets, MLUtils, Images, DataLoaders, Statistics
using EasingColorShifts: expand_dims
using Random

"""
Helper function that loads FashionMNIST images and returns loaders.
"""
function get_data_fashion_mnist(batchsize; tilesize=32, FT=Float32)
    xtrain, _ = MLDatasets.FashionMNIST(:train; Tx=FT)[:]
    xtrain = Images.imresize(xtrain, (tilesize, tilesize))
    xtrain = reshape(xtrain, tilesize, tilesize, 1, :)
    xtrain = @. 2xtrain - 1
    xtrain = MLUtils.shuffleobs(xtrain)
    loader_train = DataLoaders.DataLoader(xtrain, batchsize)

    xtest, _ = MLDatasets.FashionMNIST(:test; Tx=FT)[:]
    xtest = Images.imresize(xtest, (tilesize, tilesize))
    xtest = reshape(xtest, tilesize, tilesize, 1, :)
    xtest = @. 2xtest - 1
    loader_test = DataLoaders.DataLoader(xtest, batchsize)

    return (; loader_train, loader_test)
end

"""
Helper function that tiles an array in the first two spatial dimensions.

Tiles wrap around periodically if input width is larger than spatial size of array.

This is currently hardcoded for two spatial dimensions.
"""
function tile_array(A::AbstractArray, xwidth::Int, ywidth::Int, xstride::Int, ystride::Int)
    @assert ndims(A) == 4

    # number of tiles in x and y direction
    xsize, ysize = Base.size(A)[1:2]
    nx = floor(Int, abs(xsize - xwidth) / xstride)
    ny = floor(Int, abs(ysize - ywidth) / ystride)

    # tile up the array in spatial directions only!
    processed_data = []
    xranges = map(k -> 1+k*xstride:xwidth+k*xstride, 0:nx)
    yranges = map(k -> 1+k*ystride:ywidth+k*ystride, 0:ny)

    # if width > size of array, we wrap around periodically
    xranges = map(x -> map(y -> mod(y, xsize) != 0 ? mod(y, xsize) : xsize, x), xranges)
    yranges = map(x -> map(y -> mod(y, ysize) != 0 ? mod(y, ysize) : ysize, x), yranges)
    for (xr, yr) in Base.Iterators.product(xranges, yranges)
        push!(processed_data, A[xr, yr, :, :])
    end
    return cat(processed_data..., dims=ndims(A))
end
