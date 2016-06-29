% Calculates the average of a matrix

function toReturn = ttu_mean(values)
    counter = 0;
    total = 0;
    for i = values
        total = total + i;
        counter = counter + 1;
    end
    toReturn = total / counter;
end