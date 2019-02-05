#------------------------------------------------------------------------------#
#                                    Module                                    #
#------------------------------------------------------------------------------#

"""
# Description

    module latTypes

Basic composite types module for theoretical Lattice Boltzmann.

# Usage

```julia-repl
```
"""
module latTypes


#------------------------------------------------------------------------------#
#                                   Imports                                    #
#------------------------------------------------------------------------------#

import SymEngine


#------------------------------------------------------------------------------#
#                                   Includes                                   #
#------------------------------------------------------------------------------#



#------------------------------------------------------------------------------#
#                                   Exports                                    #
#------------------------------------------------------------------------------#

# NOTE: This module is @reexport'ed by the main package module


#------------------------------------------------------------------------------#
#                                 Definitions                                  #
#------------------------------------------------------------------------------#

# Lattice Amount type
# -------------------
# Being based on `Real`, allows for JuliaIntervals Interval types  to  compose
# lattice amounts, since the `abstract type AbstractInterval{T} <: Real` (from
# line      14      of      src/intervals/intervals.jl       from       commit
# 74d271ea9b92ce7f0c0e21d785f12c32c48148a1).
latAmt = Union{Real,SymEngine.Basic}

# Lattice Coordinate type
struct latCoord{D,T<:latAmt}
    vec::Tuple{Vararg{T,D}}
end

# Lattice velocity weights
struct latVW{D,T<:latAmt}
    v::latCoord{D,T}
    i::UInt64
    j::UInt64
end

# Lattice Name type
latID = NamedTuple{(:byVel, :byNrg),Tuple{String,String}}

# Lattice type
struct lattice{D,T<:latAmt}     # D: Euclidean dimension, T: discrete amount type
    ID::latID                   # lattice ID
    a::latAmt                   # lattice scaling factor
    b::UInt64                   # lattice velocity count
    B::UInt64                   # lattice energy level count
    c::Tuple{
        Vararg{latCoord{D,T}}
    }                           # lattice ordered velocity set
    W::Array{latAmt}            # lattice ordered weight set
    w::Array{latAmt}            # lattice weight set
end


end # module
