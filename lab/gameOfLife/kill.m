function toReturn = kill(values)
    sizeOf = size(values);
    toReturn = values;
    for a = 1:sizeOf(1)
        for b = 1:sizeOf(2)
            if values(a, b) == 1
                totalNeighbors = 0;
                if sum(values(a-1:a+1,b-1:b+1)) < 3
                    toReturn(a, b) = 0;
                end
            end
        end
    end
end