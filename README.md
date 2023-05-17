# Easing Color Shifts with Score-Based Diffusion Models
Note: CUDA is expected to be available.

## Setting up the project
Switch to the `examples/` folder.
```
julia --project -e 'using Pkg; Pkg.develop(path="../")'
julia --project -e 'using Pkg; Pkg.instantiate()'
julia --project -e 'using Pkg; Pkg.build()'
julia --project -e 'using Pkg; Pkg.precompile()'
```

## Training a model
Switch to the examples folder.
Decide on which experiment TOML to run from `/examples/fashion_mnist/experiments`.
```
julia --project training.jl EXPERIMENT_TOML
```

## Analyzing a model
Switch to the examples folder.
Decide on which experiment TOML to run from `/examples/fashion_mnist/experiments_100` or `/examples/fashion_mnist/experiments_30`.

# Basic analysis for spot checking
```julia --project analysis.jl EXPERIMENT_TOML
julia --project analysis_smooth.jl EXPERIMENT_TOML
```

# Paper submission analysis
```julia --project analysis_paper.jl EXPERIMENT_TOML
julia --project analysis_paper_smooth.jl EXPERIMENT_TOML
julia --project eval_smooth_loss.jl EXPERIMENT_TOML
```

# Plotting
Plotting scripts to regenerate figures from submission are available in examples/fashion_mnist/plots, but may require setting of custom paths to data.
Switch to the `examples/fashion_mnist/plots` folder for the plotting scripts.
