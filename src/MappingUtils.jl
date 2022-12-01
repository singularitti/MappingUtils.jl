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

end
