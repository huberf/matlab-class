% Swaps the location of two elements in a matrix.
% Supply the matrix of values and then the two indexes to swap from.

function toReturn = ttu_swap(values, index1, index2)
    temp = values(index1);
    values(index1) = values(index2);
    values(index2) = temp;
    toReturn = values;
end