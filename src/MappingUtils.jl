module MappingUtils

export mapat, mapat!, mapnested

# Map function `f` at specific indices of an array and update in-place
function mapat!(f, array, indices...)
    area = view(array, indices...)
    map!(f, area, area)
    return array
end

# Map function `f` at specific indices of an array
function mapat(f, A, indices...)
    B = deepcopy(A)
    area = view(B, indices...)
    map!(f, area, area)
    return B
end

mapnested(f, A, level) = isone(level) ? map(f, A) : map(B -> mapnested(f, B, level - 1), A)
function mapnested(f, A, level₁, level₂, levels...)
    levels = Base.vect(level₁, level₂, levels...)
    return _mapnested(f, A, 1, sort(levels))
end
function _mapnested(f, A, currentlevel, levels)
    @show levels
    if isempty(levels)
        return map(f, A)
    else
        @show currentlevel
        f′ = currentlevel == first(levels) ? f : identity
        @show f′
        nextlevel = currentlevel + 1  # Do not do in-place
        return _mapnested(f′, A, nextlevel, Base.rest(levels, nextlevel))
    end
end

end
