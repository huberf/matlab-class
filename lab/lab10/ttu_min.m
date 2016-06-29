% Calculates and returns the minimum value of an array

function toReturn = ttu_min(values)
    if length(values) == 0
        % Values are innapropriate
        toReturn = -1;
        return
    end
    curr_min = values(1);
    for i = values
        if i < curr_min
            curr_min = i;
        end
    end
    toReturn = curr_min;
end