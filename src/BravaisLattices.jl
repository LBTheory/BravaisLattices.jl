#------------------------------------------------------------------------------#
#                                   Package                                    #
#------------------------------------------------------------------------------#

"""
# 1. Description

    module BravaisLattices

Bravais (regular) lattices in  one  to  three  Euclidean  space  dimensions  for
Theoretical Lattice Boltzmann.

This package aims at providing tools for describing, storing,  and  manipulating
Bravais (regular) lattices in one to three Euclidean space dimensions.

# 2. Usage

```julia-repl
julia> import BravaisLattices

```

# 3. References

"""
module BravaisLattices


#------------------------------------------------------------------------------#
#                                   Imports                                    #
#------------------------------------------------------------------------------#

using Reexport


#------------------------------------------------------------------------------#
#                                   Includes                                   #
#------------------------------------------------------------------------------#

include("version.jl")

include("BL.jl")
@reexport using .BL


end # module
