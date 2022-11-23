module MappingUtils

export mapat, mapat!

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

end
