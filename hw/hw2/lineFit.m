function toReturn = lineFit(Xs, Ys)
    if ~(length(Xs) == length(Ys))
        fprintf('Arrays are different sizes');
    end
    xAvg = 0;
    index = 0;
    for i = Xs
        xAvg = xAvg + i;
        index = index + 1;
    end
    xAvg = xAvg / index;
    yAvg = 0;
    index = 0;
    for i = Ys
        yAvg = yAvg + i;
        index = index + 1;
    end
    yAvg = yAvg / index;
    
    xDiff = [];
    yDiff = [];
    index = 1;
    for i = Xs
        xDiff(index) = i - xAvg;
        index = index + 1;
    end
    index = 1;
    for i = Ys
        yDiff(index) = i - yAvg;
        index = index + 1;
    end
    
    diffMult = [];
    sizeOf = size(Xs);
    for i = 1:sizeOf(2)
        diffMult(i) = (Xs(i) - xAvg) * (Ys(i) - yAvg);
    end
    
    xSquare = [];
    index = 1;
    for i = Xs
        xSquare(index) = (i - xAvg)^2;
        index = index + 1;
    end
    
    numerator = 0;
    for i = diffMult
        numerator = numerator + i;
    end
    
    divisor = 0;
    for i = xSquare
        divisor = divisor + i;
    end
    
    slope = numerator / divisor;
    yIntercept = yAvg - slope * xAvg;
    
    toReturn = [slope, yIntercept];
end